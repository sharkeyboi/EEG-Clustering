function [wave] = removeLineNoise_SpectrumEstimation(wave, fs, opts)
% [wave] = removeLineNoise_SpectrumEstimation(wave, [fs], [opts])
% removeLineNoise_SpectrumEstimation removes line noise (50/60 Hz) from a
%  (chans/trials x samples) matrix, wave, which is samplel at fs Hz, and
%  returns the de-noised matrix, wave. 
%  The behaviour of the line noise removal algorithm can be controlled by
%  an optional input string, 'opts'. The following options are defined:
%       NH  = number of harmonics. (default: 1)
%       LF  = line frequency. (default: 50 Hz)
%       TOL = error tolerence. (default: 1% tol)
%       HW  = half-width of peak in samples. (default: 2)
%       M   = Size of window. (For fs = 1 kHz, m = 1024). If M is set, TOL
%                              has no effect.
%       WIN = {hanning,hamming}. Default: hanning.
% 
% Example:
% % Remove first 5 harmonics of 60 hz, using a 2048-point hanning window :
% LFP_wave = removeLineNoise_SpectrumEstimation(LFP_wave, 3000, ...
%                                            'LF = 60, NH = 5, M = 2048');
%
% This m-file is an implementation and extension of the Spectrum Estimation 
%  technique presented in: 
% Mewett, Nazeran, and Reynolds. 
% "Removing power line noise from recorded EMG," EMBS, IEEE 2001
% DOI: 10.1109/IEMBS.2001.1017205.
%
% Additionally, start-up and ending transients are minimized by padding the
% unfiltered wave with a 1-term fourier model of the line noise, based on
% the first and last m/2 samples. 
%
% If this file was useful to you, please cite Mewett, et. al.
%
%  Author:         Calvin Eiber & Alexander Pietersen
%  e-mail address: calvin.eiber@sydney.edu.au
%  Release:        1.0
%  Release date:   30 November 2015

% 0. Extract requested parameters
%    Begin by stripping whitespace from string input, make case-insensitive
if nargin<3, opts = ''; end
if nargin<2, fs = 1;   end

opts = regexprep(lower(opts), '\s*\=\s*','=');

% NH = number of harmonics
cmd = regexp(opts,'(?<=nh\=)[\.\d]+','match','once');
if isempty(cmd), nHarmonics = 1;
else             nHarmonics = round(str2double(cmd));
end
% LF = line frequency
cmd = regexp(opts,'(?<=lf\=)[\.\d]+','match','once');
if isempty(cmd), line_Hz = 50*(1:nHarmonics);
else             line_Hz = round(str2double(cmd))*(1:nHarmonics);
end
% TOL = error tolerence. 1% tol, 50 Hz, 1k sampling rate = 1024 window size
cmd = regexp(opts,'(?<=tol\=)[\.\d]+','match','once');
if isempty(cmd), err_tolerance = 0.01;
else             err_tolerance = str2double(cmd);
end
% HW = half-width of peak in samples
cmd = regexp(opts,'(?<=hw\=)[\.\d]+','match','once');
if isempty(cmd), hw = 2;
else             hw = round(str2double(cmd));
end

wave = double(wave);

% M = Size of window
cmd = regexp(opts,'(?<=m\=)[\.\d]+','match','once');
if ~isempty(cmd), m = round(str2double(cmd));
else
    % 1. We want to pick the window length m such that m is a power of 2 and
    %    m samples the line frequency to within tol%
    z = 4; err = inf; id = -1;

    while err/line_Hz(1) > err_tolerance || id < hw*2-1
        z = z+1;
        W = fs*linspace(0,1,2^z);
        [err,id] = min(abs(W-line_Hz(1)));
    end
    m = 2^z;
end

W = fs*linspace(0,1,m);
line_id = zeros(size(line_Hz));
for z = 1:nHarmonics
    [~,line_id(z)] = min(abs(W-line_Hz(z)));
end

nStep  = 2;
step   = round(m/nStep);

clear err id W z err_tolerance

fprintf('Removing Line Noise by Spectral Estimation ')

% 2. Using an m-point Hanning (or other) window and discrete Fourier 
%    transform, calculate the averaged m-point spectrum S(w) of the LFP. 
cmd = regexp(opts,'(?<=win\=)[^\s]+','match','once');
cmd = find(strncmpi(cmd,{'hann','hamming'},3),1);

if cmd == 2,
    fprintf('using a %d-point hamming window\n',m)
    window = hamming(m,'periodic')';
else
    fprintf('using a %d-point hanning window\n',m)
    window = hann(m,'periodic')';
end

% For each channel of the wave
for cc = 1:size(wave,1)
    fprintf('Channel %d\n',cc)
% 3. Pad the start and the end of the wave with a (50 Hz) sine wave fitted
%    to the phase and amplitude of the first and last snippets of wave
    lineNoise = fitoptions('fourier1','Lower',[-inf -inf -inf 40/fs*2*pi] , ...
                                      'Upper',[ inf  inf  inf 70/fs*2*pi]);
                                  
    x = (m/2+1:m); y = wave(cc,1:m/2); 
    est = fit(x',y','fourier1',lineNoise);
    pad_start = est(1:m/2);
    pad_start = pad_start-pad_start(end)+y(1);
    
    % clf, subplot(2,1,1), plot(x,y, 1:m/2,pad_start)
    
    x = (-m/2:-1); y = wave(cc,end-m/2+1:end);
    est = fit(x',y','fourier1',lineNoise); pad_end = est(0:m-1);
    pad_end = pad_end-pad_end(1)+y(end);
    
    % subplot(2,1,2), plot(x,y, 0:m-1,pad_end)
    % linkaxes(get(gcf,'children'),'x');
    pad_wave = [pad_start' wave(cc,:) pad_end'];
    
    % The moving window moves by half of the window width each time.        
    filtWave = zeros(nStep,size(pad_wave,2));
    
    for tt = 0:step:size(pad_wave,2)-m
        
        snip = pad_wave(tt+1:tt+m) .* window;
        spect = fft(snip);
% 2. Estimate the corrected value S'(w) by interpolating
%    between S(w-dw) and S(w+dw) where dw is the frequency resolution.
        for ii = 1:nHarmonics
            kk = (-hw:hw)+line_id(ii);
            est = linspace(abs(spect(kk(1))), abs(spect(kk(end))), hw*2+1);            
% 3. In the Fourier transform of the entire EMG signal, replace the 
%    magnitude at S(w) with S'(w). The phase remains unchanged.
            spect(kk) = spect(kk)./abs(spect(kk)).*est;            
            spect(m - kk + 2) = conj(spect(kk));
        end
% 4. Finally, take the inverse Fourier transform of this 'corrected' 
%    spectrum to give the EMG signal with reduced interference.        
        filtWave(mod(tt/step,nStep)+1,tt+1:tt+m) = ifft(spect);
    end
    
    filtWave = sum(filtWave,1) ./ mean(window + circshift(window,m/2,2)); 
    
    % T = (1:size(wave,2))/fs;
    % W = linspace(0,1,size(wave,2))*fs;
    % full_spect = fft(wave(cc)); 
    % clf
    % subplot(2,1,1), plot(T,wave(cc,:)); hold on
    % subplot(2,1,2), semilogy(T,abs(full_spect)); hold on
    
    wave(cc,:) = filtWave(m/2+1:end-m);
    
    % full_spect = fft(wave(cc));     
    % subplot(2,1,1), plot(T,wave(cc,:));
    % subplot(2,1,2), semilogy(T,abs(full_spect));
    
end

end