%importing data from the output files generated
filename1 = 'm1_output.out';
output_data1 = importdata(filename1);
arr1 = output_data1.data;
filename2 = 'm2_output.out';
output_data2 = importdata(filename2);
arr2 = output_data2.data;
filename3 = 'm3_output.out';
output_data3 = importdata(filename3);
arr3 = output_data3.data;
filename4 = 'm4_output.out';
output_data4 = importdata(filename4);
arr4 = output_data4.data;

%stress tensor component s33 for each voxel in all four microstructures
sigma33_1 = arr1(:,16);
sigma33_2 = arr2(:,16);
sigma33_3 = arr3(:,16);
sigma33_4 = arr4(:,16);

%strain tensor components for each voxel
epsilon33_1 = arr1(:,10);
epsilon33_2 = arr2(:,10);
epsilon33_3 = arr3(:,10);
epsilon33_4 = arr4(:,10);

%calculating the effective elastic modulus
sigma_avg = [mean(sigma33_1); mean(sigma33_2); mean(sigma33_3); mean(sigma33_4)];
epsilon_avg = [mean(epsilon33_1); mean(epsilon33_2); mean(epsilon33_3); mean(epsilon33_4)];
eff_em = sigma_avg./epsilon_avg;
second_phase_fraction = [0.1; 0.2; 0.3; 0.4];
plot(second_phase_fraction,eff_em,'-ro')
xlabel('Fraction of Second Phase', 'FontSize', 24, 'FontName', 'Times New Roman')
ylabel('$\frac{<\sigma_{33}>}{<\epsilon_{33}>}$', 'Interpreter', 'latex',...
    'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right','FontSize', 24, 'FontName', 'Times New Roman')
title('Variation of Effective Elastic Modulus', 'FontSize', 28, 'FontName', 'Times New Roman')