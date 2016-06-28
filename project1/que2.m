t = -3 : 3
f = 0.5 * (1 + cos(t));

figure(1);
stem(t, f)
xlabel('t');
ylabel('f(t)');

n = 0 : 6;
w = [0 : 6] * 2 * pi / 7;

y = f * exp(-j * (n' * w));

figure(2);
stem(n, y);
xlabel('frequency');
ylabel('amplitude');


t = -pi: pi/2 : pi

f = 0.5 * (1 + cos(t));
figure(3)
stem(t, f);
xlabel('t');
ylabel('f(t)');

n = 0 : 4;
w = n * 2 * pi / 5;

y = f * exp(-j * (n' * w));

figure(4);
stem(n, y);
xlabel('frequency');
ylabel('amplitude');

t = -2: 2 : 2

f = 0.5 * (1 + cos(t));
figure(5)
stem(t, f);
xlabel('t');
ylabel('f(t)');

n = 0 : 2;
w = n * 2 * pi / 3;

y = f * exp(-j * (n' * w));

figure(6);
stem(n, y);
xlabel('frequency');
ylabel('amplitude');
