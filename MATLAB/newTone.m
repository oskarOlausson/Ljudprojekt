function tone = newTone( fret, octave )
    %GETTONE returns a tone that hopefully sounds like a guitar tone
    %   Works by creating a frequencyresponse for an insignal


    n  = 12*octave+fret;

    fs = getFreq();
    f0 = 220*2.^(n/12);

    in=zeros(fs*4,1);

    %minus one is a silent tone
    if fret==-1
        tone=in;
        return
    end

    len=30;
    in(1:len,1)=expRampDown(ones(len,1),10);

    z=tf([1 0],[1],fs);

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

    Combined = z^L*Low*All / (z^L-All*Low*R^L);

    [num, den] = tfdata(Combined,'v');

    tone = filter(num,den,in);

    tone = normalize(tone);

end
