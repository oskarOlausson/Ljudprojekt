function out = raise( in , raisness)
%RAISE key changes -if we raise to much, then we dont
%have the notes needed

    in(in~=-100)=in(in~=-100)+raisness;
    out=in;

end

