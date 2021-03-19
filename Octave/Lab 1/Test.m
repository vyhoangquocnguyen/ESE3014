%PCM
%Generate analog signal
f = 2;
fs = 20*f; %Nyquist sampling freq
t = 0:1/fs:1; %time
a=2;
x = a*sin(2*pi*f*t);
%Level Shifting
x1 = x+a;
%Quantization
q_op = round(x1);
%Decimal to binary conversion
encode = de2bi(q_op);
% PCM receiver
deco = bi2de(encode);