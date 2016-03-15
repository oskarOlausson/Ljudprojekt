function [guitar, guitar2, base] = imageToChroma( pic )
    %bright pixel (<200) doesnt count, entirely black pixels (0) are sharp
    range=15;

    %not counting first row
    pic = pic( : , 2:end );

    [H, W] = size(pic);

    guitar= zeros(1, W)-100;
    guitar2  = guitar;
    base = guitar;

    for r=1:H
        for c=1:W
            %bright colors are not counted
            pixel=pic(r,c);
            
            if pixel<200
                if r<=range
                    guitar(c)=range-r+0.5*(pixel==0);
                elseif r<=range*2
                    guitar2(c)=range*2-r+0.5*(pixel==0);
                else
                    base(c)=range*3-r+0.5*(pixel==0);
                end
            end
        end
    end


end

