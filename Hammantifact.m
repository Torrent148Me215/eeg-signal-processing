clc 
clear all
load s_EEG.mat
Fp2_eeg=s_EEG.data(2,:);

%% split and extract the signal for each epoch
for i=1:6
   L=round(length(Fp2_eeg)/6);
   w = hamming(L);
   epoch(i,:)= Fp2_eeg((L*(i-1)+1):(L*i)).*(w');
end

%% plot every epoch window
figure
for i=1:6
subplot(3,2,i)
x=((L*(i-1)+1):(L*i));
plot(x,epoch(i,:))
var=strcat('Epoch No:',int2str(i));
title(var)
end

%%
figure
plot(Fp2_eeg)
hold on
i=1;
x=((L*(i-1)+1):(L*i));
plot(x,epoch(i,:),'r')
hold on 
i=3;
x=((L*(i-1)+1):(L*i));
plot(x,epoch(i,:),'r')
hold on 
i=6;
x=((L*(i-1)+1):(L*i));
plot(x,epoch(i,:),'r')




