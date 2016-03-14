function out = fadeOut( in , duration )
%FADEOUT Summary of this function goes here
%   Detailed explanation goes here
    b=length(in)-duration;
    x=1-b:length(in)-b;
    %our sounds are vertical
    x=x';

    a=log(0.0001)/(duration);
    
    ramp = min(1,exp(1).^(x*a));

    %combine with sound and normalize
    out = in.* ramp;
    out = normalize(out);
    
end

