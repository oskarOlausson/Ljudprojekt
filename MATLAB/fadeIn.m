function out = fadeIn( in, duration )
    %power, number from 1 and up, 
    %higher numbers means more damped sound
    x=1:length(in);
    %our sounds are vertical
    x=x';

    a=log(2)/duration;
    ramp = exp(1).^(x*a)-1;
    ramp(ramp>1)=1;

    %combine with sound and normalize
    out = in.* ramp;
    out = normalize(out);

end

