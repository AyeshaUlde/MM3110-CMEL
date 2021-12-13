step_size = linspace(0.01,0.5,10);
cdiff = zeros(1,length(step_size));
for i=1:length(step_size)
    h = step_size(i);
    t1 = func(2+h);
    t2 = func(2-h);
    cdiff(i) = (t1 - t2)/(2*h);
end
errorcd = (cdiff - (-1.0366))/(-1.0366);
%plot(step_size,abs(sym(errorcd*100)), '-bo')
%xlabel('Step size', 'FontSize', 24, 'FontName', 'Times New Roman')
%ylabel('Absolute Error %', 'FontSize', 24, 'FontName', 'Times New Roman')
%title('Central Difference Formula Error vs Step Size', 'FontSize', 28, 'FontName', 'Times New Roman')

fdiff = zeros(1,length(step_size));
for i=1:length(step_size)
    h = step_size(i);
    t1 = func(2+h);
    t2 = func(2);
    fdiff(i) = (t1 - t2)/h;
end
errorfd = (fdiff - (-1.0366))/(-1.0366);
plot(step_size,abs(sym(errorfd*100)),'-ro')
xlabel('Step size', 'FontSize', 24, 'FontName', 'Times New Roman')
ylabel('Absolute Error %', 'FontSize', 24, 'FontName', 'Times New Roman')
title('Forward Difference Formula Error vs Step Size', 'FontSize', 28, 'FontName', 'Times New Roman')

function f = func(x)
    f = exp(-2*x) - x;
end