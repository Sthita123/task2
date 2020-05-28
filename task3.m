clc;
clear all;
close all;
A=audiorecorder(8000,8,1);
disp('Recording Started!Recording time is 10 seconds');
record(A,10);
pause(10);
B=getaudiodata(A);
folder=uigetdir(path,'Save the file');
file=input('Please enter a name for your file: ','s');
filename=strcat(file,'.wav');
filename=strcat(folder,'\',filename);
disp('The path for the saved file is: ');
disp(filename);
audiowrite(filename,B,10000);
t=linspace(1,100,length(B));
Ac=10;
fc=2000;%Carrier Frequency
fs=8000;%Sampling Frequency
C=Ac*cos(2*pi*fc*t);%CARRIER SIGNAL(OUR RECORDED MESSAGE WILL BE MODULATED AS PER THIS WAVE)
c=menu('Please select the modulation type','Amplitude Modulation','Frequency Modulation');
switch c
    case 1
M=modulate(B,fc,fs,'am');
Dm=demod(M,fc,fs,'am');
P1=audioplayer(Dm,fs);
subplot(4,1,1);
plot(t',B);
xlabel('TIME');
ylabel('AMPLITUDE');
title('USER INPUT MESSAGE SIGNAL');
 
subplot(4,1,2);
plot(t',C);
xlabel('TIME');
ylabel('AMPLITUDE');
title('CARRIER SIGNAL');
subplot(4,1,3);
plot(t',M);
xlabel('TIME');
ylabel('AMPLITUDE');
title('MODULATED SIGNAL');
subplot(4,1,4);
plot(t',Dm);
xlabel('TIME');
ylabel('AMPLITUDE');
title(' DEMODULATED SIGNAL');
pause(5);
play(P1)
    case 2
        M=modulate(B,fc,fs,'fm');
Dm=demod(M,fc,fs,'fm');
P1=audioplayer(Dm,fs);
subplot(4,1,1);
plot(t',B);
xlabel('TIME');
ylabel('AMPLITUDE');
title('USER INPUT MESSAGE SIGNAL');
subplot(4,1,2);
plot(t',C);
xlabel('TIME');
ylabel('AMPLITUDE');
title('CARRIER SIGNAL');
subplot(4,1,3);
plot(t',M);
xlabel('TIME');
ylabel('AMPLITUDE');
title('MODULATED SIGNAL');
subplot(4,1,4);
plot(t',Dm);
xlabel('TIME');
ylabel('AMPLITUDE');
title(' DEMODULATED SIGNAL');
pause(5);
play(P1)
end
     