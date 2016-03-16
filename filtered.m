function out = filtered( in,f0 )

    fs=getFreq();
    z=tf([1 0],1,fs);
    

    R=0.999999;
    deltaAim=0.5;

    L = fs/f0 - deltaAim - 0.5;

    L = floor(L);
    delta = fs/f0 - L - 0.5;

    if (delta<0 || delta>1)
       L=L+1;
       delta = fs/f0 - L - 0.5;
    end

    w0 = 2*pi*f0/fs;
    a = sin((1-delta)*w0/2) / sin((1+delta)*w0/2);
    All = (z^(-1)+a)/(1+a*z^(-1));
    Low = 0.5*(1+z^(-1));
    Kam = (R^L)*(z^(-L));

    Combined = Low*All / (1-All*Low*Kam);

    [num, den] = tfdata(Combined,'v');

    out = filter(num,den,in);

end

