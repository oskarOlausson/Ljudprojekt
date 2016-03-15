function key = getKeyTones( from, to )
%GETKEYTONES sample all tones
% from to - which octaves do we need to load

    startN=(12*from);
    stopN=(12+to*12)+1;
    
    fs=getFreq();
    len=stopN-startN;
    height=fs*4;
    key=zeros(height,len);
    tones=startN:stopN;
    
    for index=1:length(tones)
        
        key(:,index)=newTone(tones(index),0);
        
    end

end

