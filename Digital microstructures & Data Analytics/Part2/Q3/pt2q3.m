%importing data from the output file generated
filename = 'ss_output.out';
output_data = importdata(filename);
arr = output_data.data;

%stress tensor components for each voxel
sigma11 = arr(:,14);
sigma22 = arr(:,15);
sigma33 = arr(:,16);
sigma23 = arr(:,17);
sigma13 = arr(:,18);
sigma12 = arr(:,19);

%strain tensor components for each voxel
epsilon11 = arr(:,8);
epsilon22 = arr(:,9);
epsilon33 = arr(:,10);
epsilon23 = arr(:,11);
epsilon13 = arr(:,12);
epsilon12 = arr(:,13);

%calculating equivalent stress using the von Mises-Hencky criteria
sigmaeq2 = 0.5*((sigma11-sigma22).^2 + (sigma22-sigma33).^2 + (sigma33-sigma11).^2 ...
    + (sigma12.^2 + sigma13.^2 + sigma23.^2).*6);
sigmaeq = sigmaeq2.^0.5;
sigmaeq_avg = mean(sigmaeq);
sigma_ratio = sigmaeq./sigmaeq_avg;

%calculating equivalent strain using the von Mises-Hencky criteria
e11 = ((epsilon11.*2) - epsilon22 - epsilon33)./3;
e22 = ((epsilon22.*2) - epsilon11 - epsilon33)./3;
e33 = ((epsilon33.*2) - epsilon22 - epsilon11)./3;
gamma12 = epsilon12.*2;
gamma13 = epsilon13.*2;
gamma23 = epsilon23.*2;
epsiloneq2 = (e11.^2 + e22.^2 + e33.^2).*1.5 + ...
    (gamma12.^2 + gamma13.^2 + gamma23.^2).*3;
epsiloneq = ((epsiloneq2.^0.5).*2)./3;
epsiloneq_avg = mean(epsiloneq);
epsilon_ratio = epsiloneq./epsiloneq_avg;

%plotting local stress concentration
figure(1)
histogram(sigma_ratio)
xlabel('Local stress concentration', 'FontSize', 24, 'FontName', 'Times New Roman')
ylabel('Number of voxels', 'FontSize', 24, 'FontName', 'Times New Roman')
title('Histogram of local stress concentration of AISI 304 Stainless Steel', 'FontSize', 28, 'FontName', 'Times New Roman')
figure(2)
boxplot(sigma_ratio)
ylabel('Local stress concentration', 'FontSize', 24, 'FontName', 'Times New Roman')
xlabel('AISI 304 Stainless Steel', 'FontSize', 24, 'FontName', 'Times New Roman')
title('Box plot of local stress concentration', 'FontSize', 28, 'FontName', 'Times New Roman')

%plotting local strain concentration
figure(3)
histogram(epsilon_ratio)
xlabel('Local strain concentration', 'FontSize', 24, 'FontName', 'Times New Roman')
ylabel('Number of voxels', 'FontSize', 24, 'FontName', 'Times New Roman')
title('Histogram of local strain concentration of AISI 304 Stainless Steel', 'FontSize', 28, 'FontName', 'Times New Roman')
figure(4)
boxplot(epsilon_ratio)
ylabel('Local strain concentration', 'FontSize', 24, 'FontName', 'Times New Roman')
xlabel('AISI 304 Stainless Steel', 'FontSize', 24, 'FontName', 'Times New Roman')
title('Box plot of local strain concentration', 'FontSize', 28, 'FontName', 'Times New Roman')