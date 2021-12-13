iters = [500;1000;2500;5000;7500;10000];
results = zeros(6,5);
for i = 1:length(iters)
    for j = 1:5
        arr = zeros(1,iters(i));
        for  k = 1:iters(i)
            if sum(randi([1 6],1,3))==10
                arr(k)= 1;
            else
                arr(k) = 0;
            end
        end
        results(i,j) = sum(arr)/iters(i);
    end
end
means = mean(results,2);
stds = std(results,0,2);
iters_heading = {'500';'1000';'2500';'5000';'7500';'10000'};
Round1_Probability = results(:,1);
Round2_Probability = results(:,2);
Round3_Probability = results(:,3);
Round4_Probability = results(:,4);
Round5_Probability = results(:,5);
table(iters_heading,Round1_Probability,Round2_Probability,...
        Round3_Probability,Round4_Probability, Round5_Probability,means,stds)

