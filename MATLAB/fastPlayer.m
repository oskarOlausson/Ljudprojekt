%loading the picture where we have our song coded
pic = imread('SKAFFARE.png');

fs=getFreq();

pic = rgb2gray(pic);

disp('reading picture')
[guitar, guitar2, base] = imageToChroma(pic);

guitar=toKey(guitar);
guitar2=toKey(guitar2);
base=toKey(base);


%tonartshöjning
% guitar=[guitar raise(guitar,1)];
% guitar2=[guitar2 raise(guitar2,1)];
% base=[zeros(1,length(base))-1 raise(base,1)];

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
playable=normalize(1.5*track1+track2+track3);

[H,W]=size(playable);
                %length of song, last notes ring out time
playthis=zeros(getSpacing()*W+      H*2,1);

%
for index=1:W
    place=getSpacing().*(index-1)+1;
    playthis(place:place+H-1)=playthis(place:place+H-1)+playable(:,index);   
end


playthis=normalize(playthis);
disp('done, playing song');
sound(playthis,getFreq());

disp('saving song');
% filename='skaffarepolskan.wav';
% audiowrite(filename,playthis,getFreq());

%playing
% for index=1:W
%     tic
% 
%     sound(playable(:,index),fs);
%     
%     
%     pause(getSpacing)./getFreq());    
% end

