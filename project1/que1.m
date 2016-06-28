t = -3.13:0.01:3.13
y = 0.5 + 0.5 * cos(t)

figure(1);
plot(t, y, '-r');
xlabel('t');
ylabel('f(t)');

seq = -313 : 313;
seq = -j * seq;

k = 0 : 313;
w = 2 * pi / 314 * k;

e = exp(seq' * w);

f = y * e * 0.01;

figure(2);
plot(w, f, '-r');
xlabel('frequency');
ylabel('amplitude');

