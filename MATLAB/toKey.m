function key = toKey( key )
    %transformers a chromatic scale to major key
    
    key(key~=-1) = key(key~=-1)*2;
    
    %[2 8 14 20] for minor key
    %[5 11 17 23] for mixolydian
    %[5 12 17 24] for major
    
    for i=[2 8 14 20]
        key(key>i)=key(key>i)-1;
    end
    %hej
end

