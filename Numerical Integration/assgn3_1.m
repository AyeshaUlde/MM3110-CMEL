a = -2;
b = 4;
step_size = [0.01; 0.016; 0.02; 0.04; 0.0625; 0.08; 0.1; 0.125; 0.16; 0.2];
I = zeros(length(step_size),1);
for j = 1:length(step_size)
    ss = step_size(j);
    arr = (-2:ss:4);
    odd_is = arr(2:2:end-1);
    even_is = arr(3:2:end-2);
    I1 = func(arr(1));
    I2 = 4*sum(func(odd_is));
    I3 = 2*sum(func(even_is));
    I4 = func(arr(end));
    I(j) = ((b-a)*(I1 + I2 + I3 + I4))/(3*(length(arr) - 1));
end
Iper = ((I - 1104)*100)/1104;
plot(step_size,Iper, 'Marker','o', 'MarkerFaceColor','b')
xlabel('Step size', 'FontSize', 24, 'FontName', 'Times New Roman')
ylabel('Error %', 'FontSize', 24, 'FontName', 'Times New Roman')
title('Error vs Step size plot', 'FontSize', 28, 'FontName', 'Times New Roman')
%yticks(-350:50:50)
function f = func(x)
    f = 1 - x - (4*x.^3) + (2*x.^5);
end