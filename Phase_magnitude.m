clc
clear all
%% unwrap(angle(hilbert(x)) phase
% fs = 1kHz
fs = 1000;
t = 0:1/fs:1;

%sampling
sinusN = sin(2*pi*t);
chirpN = chirp(t,0,1,100);
whiteN = wgn(length(t), 1, 0);

SP=unwrap(angle(hilbert(sinusN)));
CP=unwrap(angle(hilbert(chirpN)));
WP=unwrap(angle(hilbert(whiteN)));

%% 
figure
subplot(3,2,1)
plot(t,sinusN)
title('sine wave signal')
subplot(3,2,2)
plot(t,SP)
title('Instantaneous phase of sine wave')

subplot(3,2,3)
plot(t,chirpN)
title('chirp wave signal')
subplot(3,2,4)
plot(t,CP)
title('Instantaneous phase of chirp wave')

subplot(3,2,5)
plot(t,whiteN)
title('white noise signal')
subplot(3,2,6)
plot(t,WP)
title('Instantaneous phase of white noise')


%% load eeg signal
load Fp2_eeg.mat
fs = 500;   % sampled at 500Hz
t = 1/fs:1/fs:(length(Fp2_eeg)/fs);

%% alpha filter 8-12 Hz
f_low = 8;   % low cutoff freq 8Hz
f_high = 12 ;% high cutoff freq 12Hz

[b,a] = butter(1,[f_low f_high]/(fs/2),'bandpass');
Fp2_fitred = filtfilt(b,a,Fp2_eeg);
figure
subplot(2,1,1)
plot(Fp2_eeg)
xlabel('Time(s)')
ylabel('Amplitude')
title('Original Fp2 EEG signal')

subplot(2,1,2)
plot(t,Fp2_fitred)
xlabel('Time(s)')
ylabel('Amplitude')
title('Filterd alpha range in Fp2 EEG signal(8~12 Hz)')

%% Verify the frequency of filtred signal
Nfft=length(Fp2_fitred);
V_alpha=fft(Fp2_fitred);
F=(1:Nfft)*fs/Nfft;
figure
plot(F,abs(V_alpha))
xlim([0 20])
grid on

%% phase variation
figure
Fp2_phase=unwrap(angle(hilbert(Fp2_fitred)));
plot(t,Fp2_phase)
xlabel('Time(s)')
ylabel('Phase')
title('Phase shift in filterd alpha range')
