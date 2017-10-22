clc
clear all;

%%
%generate a square function with a period of 2*pi*f
fs=10000;                           %Sampling frequency
t=0:1/fs:1.5;
y=square(2*pi*50*t);
plot(t,y),axis([0 0.2 -1.2 1.2])
xlabel('Time(s)');
ylabel('Amplitude');
title('Square Periodic Wave')

%%
% fft analysis
NFFT=length(y);
Y_FFT=fft(y,NFFT);

window = [];                        %the window function and noverlap as a default value
noverlap = [];
Y_PWE = pwelch(y,window,noverlap,NFFT,fs);
Y_PERI = periodogram(y,window,NFFT);

magnitudeY_FFT=abs(Y_FFT);          %Magnitude
magnitudeY_PWE=abs(Y_PWE);         
magnitudeY_PERI=abs(Y_PERI);

dBmagnitudeY_FFT=10*log10(magnitudeY_FFT);
dBmagnitudeY_PWE=10*log10(magnitudeY_PWE);
dBmagnitudeY_PERI=10*log10(magnitudeY_PERI);
%%
F=(1:(NFFT+1)/2)*fs/NFFT;

figure
subplot(3,1,1)
plot(F,dBmagnitudeY_FFT(1:(NFFT+1)/2));
xlim([0 5000])
xlabel('Frequency(Hz)');
ylabel('DB');
title('FFT in function analysis')
subplot(3,1,2)
plot(F,dBmagnitudeY_PWE);
xlabel('Frequency(Hz)');
ylabel('DB');
title('Pwelch in function analysis')
xlim([0 5000])
subplot(3,1,3)
plot(F,dBmagnitudeY_PERI);
xlim([0 5000])
xlabel('Frequency(Hz)');
ylabel('DB');
title('Periodogram in function analysis')
