close all
clc
clear all

%%
Fs = 200;                 %Sampling frequency
t = 0:1/Fs:1;             %Time vector of 1 second
x=chirp(t,0,1,Fs/6);

%%
%Fast fourier transform
NFFT=length(x);
F=((0:1/NFFT:1-1/NFFT)*Fs);%1/NFFT is the frequency resolution
X_FFT=fft(x,NFFT);
Ampli_Xfft=20*log10(abs(X_FFT));

%%
%Draw the graph
figure
subplot(3,1,1)
plot (t,x)
title('Chirp Signal');
xlabel('Time(s)');
ylabel('Amplitude');

subplot(3,1,2)
stem(t,x)
title('The discrete sample representation of Chirp Signal');
xlabel('Time(s)');
ylabel('Amplitude');

subplot(3,1,3)
plot(F,Ampli_Xfft)
axis([0 100 -10 30])
title('Power Spectrum of Chirp Signal');
xlabel('Frequency(Hz)');
ylabel('Power(dB)');




