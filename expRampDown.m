function out = expRampDown( in, power )
    %power, number from 1 and up, 
    %higher numbers means more damped sound
    x=1:length(in);
    %our sounds are vertical
    x=x';

    a=log(0.001)/length(in);
    ramp = exp(1).^(x.*a);

    %combine with sound and normalize
    out = in.* ramp.^power;
    out = normalize(out);

end

