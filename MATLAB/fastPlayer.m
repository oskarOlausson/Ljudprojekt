%loading the picture where we have our song coded
pic = imread('onetone.png');

fs=getFreq();

pic = rgb2gray(pic);

disp('reading picture')
[guitar, guitar2, base] = imageToChroma(pic);

%guitar=toKey(guitar);
%guitar2=toKey(guitar2);
%base=toKey(base);


%tonartsh?jning
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
 filename='onetone.wav';
 audiowrite(filename,playthis,getFreq());

 [in, FS]=audioread('onetone.wav');
N = length(in)
df = FS/N;
dt = [-FS/2 : df : FS/2-df];
shift= fftshift(abs(fft(in)))./N;

plot (dt, shift,'r'); axis([0 20000 0 0.01]);

%playing
% for index=1:W
%     tic
% 
%     sound(playable(:,index),fs);
%     
%     
%     pause(getSpacing)./getFreq());    
% end

