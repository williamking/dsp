t = -1:0.01:1;
m = -1:0.01:1;

for i = -100: 100
    if (abs(i) <= 53)
        m(i + 101) = 1;
    else
        m(i + 101) = 0;
    end
end

figure(1);
plot(t,m);
xlabel('w/pi sacled frequency');
ylim([0,1.2]);
ylabel('Magnitude');

x = [-1, -0.67, -0.4, 0, 0.4, 0.67, 1];
y = [0, 0, 1, 1, 1, 0, 0];

plot(x, y, '-r');
xlabel('w/pi sacled frequency');
ylim([0,1.2]);
ylabel('Magnitude');
