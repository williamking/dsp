t = -3 : 3
f = 0.5 * (1 + cos(t));
figure(1);
stem(t, f); % origin signal

n = 0 : 6;
w = [0 : 6] * 2 * pi / 7;

y = f * exp(-j * (n' * w));

filter = [1, 1, 1, 0, 0, 0, 0]; %low pass filter in the frequency domain

y = y .* filter; 

x = y * exp(j * (n' * w)) / 7; % reconstruct the signal

figure(2);
stem(t, x); % reconstructed signal

subs = abs(f - x);
figure(3);
stem(t, subs); % absolute error

t = -2: 2 : 2
f = 0.5 * (1 + cos(t));
figure(4);
stem(t, f);

n = 0 : 2;
w = n * 2 * pi / 3;

y = f * exp(-j * (n' * w));

filter= [1, 1, 0]; %low pass filter in the frequency domain

y = y.* filter;

x = y * exp(j * (n' * w)) / 3; % reconstruct the signal

figure(5);
stem(t, x); % reconstructed signal

subs = abs(f - x);
figure(6);
stem(t, subs); % absolute error