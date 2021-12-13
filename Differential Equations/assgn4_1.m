h = 0.05; %step size
time = (0:h:2);
y_1 = zeros(1,length(0:0.05:2));
f = @(t,y)((y*t^3) - (1.5*y));
t_0 = 0;
y_0 = 1;
y_1(1) = y_0;
for i = 1:(length(time)-1) 
    t_0 = time(i);
    y_0 = y_1(i);
    k1 = h*f(t_0,y_0);
    k2 = h*f(t_0 + 0.5*h, y_0 + 0.5*k1);
    k3 = h*f(t_0 + 0.5*h, y_0 + 0.5*k2);
    k4 = h*f(t_0 + h, y_0 + k3);
    y1 = y_0 + ((k1 + 2*k2 + 2*k3 + k4)/6);
    y_1(i+1) = y1;
end
y = exp(((time.^4)/4) - (1.5*time));
plot(time,y_1,'--b','LineWidth',2.25)
xlabel('t', 'FontSize', 24, 'FontName', 'Times New Roman')
ylabel('y(t)', 'FontSize', 24, 'FontName', 'Times New Roman')
title('Plot of Analytical and Numerical solutions of ODE', 'FontSize', 28, 'FontName', 'Times New Roman')
hold on
plot(time, y, '-r','LineWidth',1)
hold off
legend('Numerical solution', 'Analytical solution','Location','northwest','FontSize', 20, 'FontName', 'Times New Roman')
