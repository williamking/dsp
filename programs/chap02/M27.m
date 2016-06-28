%Draw the continue function
x = linspace(0, 1, 500);
T = input('The angle frequency of the function is (2 * pi * T), T = ');
k = input('The sequence of value k = ');
fi = input('The phase of the funcion = ');
ST = input('The angle frequency of the sampling is (2 * pi *  ST), ST = ');
A = input('The amplitude of the function = ');

for kk=k
    y = A * cos(2 * pi * T * x + fi + kk * 2 * pi * ST * x);
    plot(x, y, ':');
    hold on;
    % Draw the sampling points
    px = 0 : (1 / ST) : 1;
    py = A * cos(2 * pi * T * px + fi + kk * 2 * pi * ST * px);
    plot(px, py, 'o');
    hold on;
end

t = (1 / ST);

x = 0 : (1/ST) : 1

n = 0 : length(x) - 1;

y = A * cos(2 * pi * T * n / ST + fi);

plot(x, y, '>');
