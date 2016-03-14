function tone = fastTone( fret , keys)
%FASTTONE Ordo one implementation of guitarTone
%   Needs that getKeyTones has been used
    if (fret>=0)
        tone = keys( : , fret+1 );
    else
        tone = zeros(getFreq()*4,1);
    end

end

