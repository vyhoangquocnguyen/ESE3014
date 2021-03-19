
xn = 0:4*(pi/sp):8*pi;
[rX,cX] = size(xn(:,:));
swave = 10*cos(xn); %sampled signal
subplot(4,1,1); 
plot(swave); 
title("Analog Signal-Cosine Wave");

subplot(4,1,2); stem(swave); grid on;
title('Sampled Cosine Wave');

% Quantization Process
aMax = 15; 
aMin = -aMax; 
div = 2*aMax/(2^3-1);
u = aMax+ div;
pdiv = aMin:div:aMax;
qVal = [aMin:div:u];
[iVal,fVal] = quantiz(swave,pdiv,qVal); %Quantized signal