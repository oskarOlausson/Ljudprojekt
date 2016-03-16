[~,W]=size(playable);
space=0.15;
%playing
for index=1:W
    tic
    
    sound(playable(:,index),fs);
    
    pause(space-toc);    
end
