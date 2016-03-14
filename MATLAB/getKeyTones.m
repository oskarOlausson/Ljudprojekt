function key = getKeyTones( from, to )
%GETKEYTONES sample all tones
% from to - which octaves do we need to load
    key=[];

    for n= (12*from)+3 :(12+to*12) +2 +3
        key=[key newTone(n,0)];
    end

end

