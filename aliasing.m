clc
close all;
clear all;

%%
Fs = 200;%Sampling frequency
t = 0:1/Fs:1-1/Fs;%Time vector of 1 second
x=chirp(t,0,1,Fs/6);

%10HZ
dx=x(1:20:end);% sample every 20 points
dt=t(1:20:end)*Fs;


%real 20HZ
fs = 20;                    %Sampling frequency
t2 =0:1/fs:1-1/fs;          %Time vector of 1 second
x2=chirp(t2,0,1,Fs/6);
%%
figure
subplot(2,1,1)
plot(x);
hold on
plot(dt,dx);
title('Sampling fs = 10Hz')

subplot(2,1,2)
plot(x);
hold on
plot(t2*Fs,x2)
title('Sampling fs = 20Hz')

%% Filter the data
x=chirp(t,0,1,Fs/6);
[b,a]=butter(3,4/200,'low');
y=filtfilt(b,a,x);

                        %resample real 20HZ
t2=1:10:length(y);      %Time vector of 1 second
y2=y(1:10:end);

figure
plot(t2,y2)
hold on
plot(y)
grid on
title('Chirp Signal and filtered signal');
xlabel('Time(s)');
ylabel('Amplitude');






