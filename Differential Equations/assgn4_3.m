h = 0.05;
time = (0:h:3);
f1 = @(a, b, c)((10*a*c) + b);
f2 = @(a, b, c)((10*a*c) - b);
f3 = @(a, b, c)(-(10*a*c) + b - (2*c));
a = zeros(1, length(time));
b = zeros(1, length(time));
c = zeros(1, length(time));
a(1) = 50;
b(1) = 0;
c(1) = 40;
for i= 1:(length(time) - 1)
    a(i+1) = a(i) + h*f1(a(i), b(i), c(i));
    b(i+1) = b(i) + h*f2(a(i), b(i), c(i));
    c(i+1) = c(i) + h*f3(a(i), b(i), c(i));
end
plot(time(1:5), a(1:5), '-r','LineWidth',1)
xlabel('t (s)', 'FontSize', 24, 'FontName', 'Times New Roman')
ylabel('Concentration', 'FontSize', 24, 'FontName', 'Times New Roman')
title('Plot of Concentration vs Time', 'FontSize', 28, 'FontName', 'Times New Roman')
hold on
plot(time(1:5), b(1:5), '--b', 'LineWidth',1.5)
hold on
plot(time(1:5), c(1:5), ':g', 'LineWidth',1.25)
hold off
legend('Concentration c_{a}', 'Concentration c_{b}', 'Concentration c_{c}', 'Location','northwest','FontSize', 20, 'FontName', 'Times New Roman')