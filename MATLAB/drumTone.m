function out = drumTone()
    fs=getFreq();
    
    tone=newTone(0,-2);
    in=tone+randn(length(tone),1)*2-1;
    
    out=expRampDown(in,10);
    [R, C]=size(out);
    out=imresize(out,[R*2 C]);    
    out=conv(ones(1,20)./20,out);
    out=normalize(out)*0.3;
    sound(out, fs);
end
