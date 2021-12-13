result = zeros(10000,1);
for i = 1:10000
    arr = zeros(1,i);
    for j = 1:i
        if sum(randi([1 6],1,3))==10
            arr(j)= 1;
        else
            arr(j) = 0;
        end
    end
    result(i) = sum(arr)/i;
end
plot(result)
title('Rolling 3 Dice Experiment', 'FontSize', 28, 'FontName', 'Times New Roman')
xlabel('No. of iterations', 'FontSize', 24, 'FontName', 'Times New Roman')
ylabel('Probability of obtaining 10', 'FontSize', 24, 'FontName', 'Times New Roman')
xticks(0:500:10000);