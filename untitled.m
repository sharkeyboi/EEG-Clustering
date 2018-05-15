 % generate circular data 
   t=linspace(-pi , +pi , 100);  % angular value t=-pi,...,+pi
   data = [sin(t);cos(t)];       % circle
   data = data + 0.2*randn(size(data));    % add noise

   % nonlinear PCA (circular PCA, inverse network architecture)
   [c,net]=nlpca(data, 1,  'type','inverse',  'circular','yes' );
                                
   % plot components             
   nlpca_plot(net)  
  