%Draw the continue function
x = linspace(0, 1, 500);

y1 = cos(6 * pi * x);
y2 = cos(14 * pi * x);
y3 = cos(26 * pi * x);
plot(x, y1, 'r');
hold on;
plot(x, y2, ':m');
hold on;
plot(x, y3, ':.b');

% Draw the sampling function
px = 0:0.1:1;
py1 = cos(6 * pi * px);
py2 = cos(14 * pi * px);
py3 = cos(26 * pi * px);
plot(px, py1, 'o');
hold on;
plot(px, py2, '*');
hold on;
plot(px, py3, 'p');