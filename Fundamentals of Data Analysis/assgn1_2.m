result = zeros(10000,1);
b_socks_left = zeros(10000,1);
w_socks_left = zeros(10000,1);
for i = 1:length(result)
    arr2 = zeros(1,50);
    b_socks = 50;
    w_socks = 50;
    for j = 1:50
        arr = rand(1,2);
        if (arr(1)>= 0.5) &&(arr(2)>= 0.5)
            arr2(j)=1;
            if b_socks>=2
                b_socks = b_socks - 2;
            end
        elseif (arr(1)<0.5) && (arr(2)<0.5)
            arr2(j)=1;
            if w_socks>=2
                w_socks = w_socks - 2;
            end
        else
            arr2(j)=0;
            if (b_socks>=1) && (w_socks>=1)
                b_socks = b_socks - 1;
                w_socks = w_socks - 1;
            end
        end
    end
    result(i) = sum(arr2);
    b_socks_left(i) = b_socks;
    w_socks_left(i) = w_socks;
end
histogram(result,'Normalization','probability')
title('Random Selection  of Socks', 'FontSize', 28, 'FontName', 'Times New Roman')
xlabel('No. of pairs', 'FontSize', 24, 'FontName', 'Times New Roman')
ylabel('Probability', 'FontSize', 24, 'FontName', 'Times New Roman')
txt = {'No. of iterations = 10000'};
text(27,0.115,txt,'FontSize',24, 'FontName', 'Times New Roman')