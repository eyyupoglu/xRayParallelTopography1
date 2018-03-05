function [a , error, condNum, rankA, x_lsqr, xtilde] = 
myFunction(N,theta,p,isDisp, noiselevel)
    L=1;
    d=N-1;
    t=0.01;
    delta = L/N;
    if isDisp
        [a,b,x,~,~,~]  = paralleltomo(N,theta,p, d, t);
    else
        [a,b,x,~,~,~]  = paralleltomo(N,theta,p, d);
    %rank1 = rank(full(a))
    imagesc(reshape(x, N, N));
    b = a *x;
    a=a*delta;
    
    rankA = rank(full(a));
    
    x_noNoise = a\b;
    imagesc(reshape(x_noNoise, N, N));

    x_lsqr = lsqr(a,b);
    imagesc(reshape(x_lsqr, N, N));

    g= a\b;
    imagesc(reshape(g, N, N));
    %new_x1 = inv(a)*b
    %add noise
    
    
    for i = 1:5%Note that we are using different seeds every time
        btilde = b + noiselevel*randn(size(b));
        %getting x from backward
        xtilde = a\btilde;
        imagesc(reshape(xtilde, N, N));
        error(i) = norm(x - xtilde)/norm(x);
        condNum = cond(full(a));
    end
    
end