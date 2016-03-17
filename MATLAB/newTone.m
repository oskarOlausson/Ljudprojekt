function tone = newTone( fret, octave )
    %GETTONE returns a tone that hopefully sounds like a guitar tone
    %Works by creating a frequency response for an insignal


    n  = 12*octave+fret;

    fs = getFreq();
    f0 = 220*2.^(n/12);

    in=zeros(fs*4,1);

    %minus one is a silent tone
    if fret==-100
        tone=in;
        return
    end

    len=30;
    in(1:len,1)=randn(len,1);
    
    tone=filtered(in,f0);
    
    %the notes fade out quickly when the next note comes
    tone = fadeOut(tone,fs*4-getSpacing()*2,2);
   
    tone = normalize(tone);

end

