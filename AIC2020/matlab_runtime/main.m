
[x,fs] = audioread('greeting.wav');

win = 512;
x1 = x(1:win);
x2 = fft(x1);
x2 = ifft(x2);

y = sum(x1-x2);
disp(y)

a = 12.34;
b = func(a);
disp(b);