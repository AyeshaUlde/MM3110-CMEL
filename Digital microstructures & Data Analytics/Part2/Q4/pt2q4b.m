%importing data from the output file generated
filename = 'plate_output.out';
output_data = importdata(filename);
arr = output_data.data;

%stress tensor component s22 for each voxel
sigma22 = arr(:,15);

%voxel ids
c1 = (1:512)';
c_2 = ones(512,1);
v_ids = [c1 c_2];
for i = 2:512
    c2 = repmat(i,512,1);
    arr = [c1 c2];
    v_ids = cat(1,v_ids,arr);
end

%plotting 2D stress profile
sigmayy = max(reshape(sigma22,[512,512]));
plot(c1,sigmayy')
xlim([0 512])
xlabel('x axis', 'FontSize', 24, 'FontName', 'Times New Roman')
ylabel('$\sigma_{22}^{max}$', 'Interpreter', 'latex', 'FontSize', 24, 'FontName', 'Times New Roman')
title('Stress Profile', 'FontSize', 28, 'FontName', 'Times New Roman')