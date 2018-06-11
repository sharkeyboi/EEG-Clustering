tsneoutput = [];
error = [];
counter = 1;
icounter = 1;
jcounter = 1;
explained = [];
for itr = 1:3
    for jtr = 3:2:9
        if jtr <= itr
            continue;
        end;
        disp(strcat('Iteration: ',num2str(counter)));
		[pxx, freq, pcascore, explained(:,itr,jtr),~] = transformdata(downsampled, itr,jtr);
		[tsneoutput(:,:,icounter, jcounter), error(icounter, jcounter)] = tsne(pxx');
		counter = counter + 1;
        jcounter = jcounter + 1;
    end
    icounter = icounter + 1;
    jcounter = 1;
end