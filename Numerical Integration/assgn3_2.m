time = (0:0.01:0.5);
odd_is = time(2:2:end-1);
even_is = time(3:2:end-2);
a = 0;
b = 1;
I1 = func(time(1));
I2 = 4*sum(func(odd_is));
I3 = 2*sum(func(even_is));
I4 = func(time(end));
I_sq = ((b-a)*(I1 + I2 + I3 + I4))/(3*(length(time) - 1));
I_rms = I_sq.^0.5

fun = @(x)(5*exp(-1.25.*x).*sin(2*pi.*x)).^2;
i_rms1 = integral(fun,0,0.5);
i_rms = i_rms1^0.5

t1 = (0:0.01:0.5);
i_t = (5*exp(-1.25.*t1).*sin(2*pi.*t1)).^2;
t2 = (0.51:0.01:1);
i_t2 = zeros(1,length(t2));
figure
x = [t1 t2];
y = [i_t i_t2];

plot(x,y, 'LineWidth', 2.5)
xlabel('t (s)', 'FontSize', 24, 'FontName', 'Times New Roman')
ylabel('i(t) (A)', 'FontSize', 24, 'FontName', 'Times New Roman')
title('i(t) vs t', 'FontSize', 28, 'FontName', 'Times New Roman')

function f = func(t)
    f = (5*exp(-1.25.*t).*sin(2*pi.*t)).^2;
end