%loading the picture where we have our song coded

pic = imread('SONG.png');
space=.15;
fs=getFreq();

pic = rgb2gray(pic);
disp('reading picture')
[guitar, guitar2, base] = imageToChroma(pic);

guitar=toKey(guitar);
guitar2=toKey(guitar2);
base=toKey(base);

disp('making tones');

key=getKeyTones(0,1);
keyLow=getKeyTones(-1,0);

track1=zeros(fs*4,length(guitar));
track2=zeros(fs*4,length(guitar));
track3=zeros(fs*4,length(guitar));

disp('putting song together');
for index=1:length(guitar)

    track1(:,index) = fastTone(guitar(index),key);
    track2(:,index) = fastTone(guitar2(index),keyLow);
    track3(:,index) = fastTone(base(index),keyLow);
    
end

disp('mixing');
%mixing together
playable=normalize((track1*2)+track2+track3);



disp('done, playing song')
[~,W]=size(playable);
%playing
for index=1:W
    tic
    
    sound(playable(:,index),fs);
    
    pause(space-toc);    
end

