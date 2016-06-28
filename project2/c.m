[N, Wn] = buttord(3, 5, 0.3, 40, 's');
[Z, P, K] = butter(N, Wn, 's');
[H, W] =zp2tf(Z, P, K);
figure(1);
[P, Q] = freqs(H, W);
plot(Q * 15/(2*pi), abs(P));
xlabel('frequency/HZ');
ylabel('magnitude');

[N, Wn] = cheb2ord(3, 5, 0.3, 40, 's');
[Z, P, K] = cheby2(N, 40, Wn, 's');
[H, W] =zp2tf(Z, P, K);
figure(2);
[P, Q] = freqs(H, W);
plot(Q * 15/(2*pi), abs(P));
xlabel('frequency/HZ');
ylabel('magnitude');

[N, Wn] = ellipord(3, 5, 0.3, 40, 's');
[Z, P, K] = ellip(N, 0.3, 40, Wn, 's');
[H, W] =zp2tf(Z, P, K);
figure(3);
[P, Q] = freqs(H, W);
plot(Q * 15/(2*pi), abs(P));
xlabel('frequency/HZ');
ylabel('magnitude');