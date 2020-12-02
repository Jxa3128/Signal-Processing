% Jorge Avila mavID: 1001543128

clc 
clear
close all

%{

Description:
In this project, you will be designing a filter to remove unwanted noise 
from an audio file.You will accomplish with the paper design of a 
Butterworthlowpass filter.  The designed filter will then be implemented in
MATLAB and used to filter the audio and compare to the unfiltered audio.

%}

% 1. Audio Frequency Analysis
audioFileName = 'noisyaudio.wav';
[y,Fs] = audioread(audioFileName);
myAudio_DFT = fft(y);

% form a freq axis for plotting the DFT
freqAxis = linspace(-(Fs/2),(Fs/2),length(y));

% plot the magnitude DFT vs frequency
subplot(2,2,1);

plot(freqAxis,fftshift(abs(myAudio_DFT)));
xlabel('Frequency (Hz)');
ylabel('Magnitude of DFT');
title(' Magnitude of DFT vs Frequency');


% Plot the normalized log plot of the DFT,
% where the max value of the DFT is 0db.
db = 20.*log10(abs(myAudio_DFT)/max(abs(myAudio_DFT)));
subplot(2,2,2);
plot(freqAxis,fftshift(db));
xlabel('Frequency (Hz)');
ylabel('Magnitude of DFT');
title(' Normalized Log Plot of DFT');


% 2. Filter Design
% decide on a digital freq w_p for the end passband
Wp = 1900; %Hz
Ws = 2500; % Hz
Rp = -1; % -1 db
Rs = -60; % db
minAtten = .5;

% Solve for the nth order
% https://youtu.be/hg3wMmTI_Oc?t=498
args = (10.^(-Rs/10) - 1) / (10.^(-Rp/10) - 1);
N = (log10(args)) / (2*log10(Ws/Wp));
N_rounded = round(double(N))+1;
FreqCut1 = Wp/(10^(-Rp/10)-1)^(1/(2*N_rounded));
FreqCut2 = Ws/(10^(-Rs/10)-1)^(1/(2*N_rounded));

% Find Ha(s)
Ha_s = 20*log10(sqrt(1./(1+(freqAxis/FreqCut1).^(2*N_rounded))));

% plot the log gain
% bandpass filtert should be shown
subplot(2, 2, 3);
plot(freqAxis, Ha_s);
xlabel('Frequency [Hz]');
ylabel('Magnitude [dB]');
title('Logarithmic Gain vs Frequency of DFT');

% 3. Filter Implementation

% first find Wn from the pdf
Wn = FreqCut1/(Fs/2);
[b,a] = butter(N_rounded, Wn);
new_myAudio_DFT = fft(filter(b,a,y));

% plot new filtered signal
subplot(2, 2, 4);
plot(freqAxis,fftshift(abs(new_myAudio_DFT)));
xlabel('Frequency (Hz)');
ylabel('Magnitude of DFT');
title(' Magnitude of new DFT vs Frequency');
% play the sound back
sound(filter(b,a,y),Fs);

%{
    This audio was from a clip in the movie called: "Airplane"
    which was directed by: Jim Abrahams, David Zucker, Jerry Zucker	

% The following is the transcript:  

    Rumack:
Captain, how soon can you land?

Captain Oveur:
I can't tell.

Rumack:
You can tell me. I'm a doctor.

Captain Oveur:
No. I mean I'm just not sure.

Rumack:
Well, can't you take a guess?

Captain Oveur:
Well, not for another two hours.

Rumack:
You can't take a guess for another two hours?

%}
