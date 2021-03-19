% Input Signal
clc;
clear;
close all;

input_amp = 3; % amplitude of input signal
freq = 3;
fs = 20*freq; % Nyquist sampling freq
t = 0:1/fs:1; %time
input_signal = input_amp*sin(2*pi*freq*t); % input signal
noise = rand(size(input_signal)); % inputting noise to the input signal
input_signal2 = input_signal + noise;
subplot(4,1,1);
plot(t,input_signal2); % plotting the input signal
title('Input Signal');
xlabel('Time');
ylabel('Amplitude');

%Level shifting
psignal = input_amp +input_signal2; % shifting to get the positive signal

% Low pass filter
Denominator = [1,1.414,1]; % denominator of transfer function
Numerator = 3.5; % numerator of transfer function
filter_signal = filter(Denominator,Numerator,psignal); %filtered signal
subplot(4,1,2);
plot(t,filter_signal); % to plot filtered signal
title('Filtered Signal');
xlabel('Time');
ylabel('Amplitude');


% sampling the signal
subplot(4,1,3)
stem(filter_signal); % to plot filter signal in descrete form
xlabel('Time');
ylabel('Amplitude');


binary = round(filter_signal); %rounding up amplitude of quantized signal

%non-uniform quantization of signal
partition = -1:0.5:5;
codebook = -1:0.1:(5+0.1);
[index,quants] = quantiz(psignal,partition,codebook);
subplot(4,1,4);
plot(t,binary); % to plot the quantized signal
title('quantized signal');
xlabel('Time');
ylabel('Amplitude');

binary = round(filter_signal); %rounding up amplitude of quantized signal
%Encoding
enco = de2bi(binary);
%PCM Receiver
deco = bi2de(enco);
%shifting the amplitude to the original value
out_signal = deco - input_amp;
%Plotting
figure; plot(t,input_signal, 'r-', t, out_signal,'k+-');
xlabel('Time');
ylabel('Amplitude');
%

figure;
bar(stairs(enco));
ylim([0 1.5]);
title('Binary');
figure
bar(1:length(enco),enco(1:length(enco)))
