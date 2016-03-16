function out = normalize( in )
    %This function normalizes the insignal into -1 to 1 range
    out = in/max(abs(in(:)));

end

