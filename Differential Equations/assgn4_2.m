c = 12.5;
m = 70;
g = 9.8;
h = 0.25; %step size
time = (0:h:12);

v_1 = zeros(1, length(time));
v_0 = 453; %intial guess
v_1(1) = v_0;

f2 = @(t,x,v)(g - c*(v/g));
f1 = @(t,x,v)v;
x_1 = zeros(1, length(time));
x_0 = 0;
x_1(1) = x_0;
for i = 1:(length(time)-1) 
    t_0 = time(i);
    v_0 = v_1(i);
    x_0 = x_1(i);
    k1 = h*f2(t_0, x_0, v_0);
    k2 = h*f2(t_0 + 0.5*h, x_0, v_0 + 0.5*k1);
    k3 = h*f2(t_0 + 0.5*h, x_0, v_0 + 0.5*k2);
    k4 = h*f2(t_0 + h, x_0, v_0 + k3);
    v1 = v_0 + ((k1 + 2*k2 + 2*k3 + k4)/6);
    v_1(i+1) = v1;
    k11 = h*f1(t_0,x_0,v_0);
    k21 = h*f1(t_0 + 0.5*h, x_0 + 0.5*k1,v_0);
    k31 = h*f1(t_0 + 0.5*h, x_0 + 0.5*k2,v_0);
    k41 = h*f1(t_0 + h, x_0 + k3,v_0);
    x1 = x_0 + ((k11 + 2*k21 + 2*k31 + k41)/6);
    x_1(i+1) = x1;
end
plot(time, x_1, '-r', 'LineWidth',1)
xlabel('t', 'FontSize', 24, 'FontName', 'Times New Roman')
yyaxis right
ylabel('Position x(t) (m)', 'FontSize', 24, 'FontName', 'Times New Roman')
yyaxis left
ylabel('Velocity v(t) (m s^{-1})', 'FontSize', 24, 'FontName', 'Times New Roman')
title('Plot of Position x(t) & Velocity v(t)', 'FontSize', 28, 'FontName', 'Times New Roman')
hold on
plot(time, v_1, '--b', 'LineWidth',1)
hold off
legend('Position x(t)', 'Velocity v(t)', 'Location','northwest','FontSize', 20, 'FontName', 'Times New Roman')