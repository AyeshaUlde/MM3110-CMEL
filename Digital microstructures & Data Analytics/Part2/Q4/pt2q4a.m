n = 512*512; %total number of voxels

%euler angles for each voxel
angle = [60 180 90];
euler = repmat(angle,n,1);

%generating voxel ids
c1 = (1:512)';
c_2 = ones(512,1);
v_ids = [c1 c_2];
for i = 2:512
    c2 = repmat(i,512,1);
    arr = [c1 c2];
    v_ids = cat(1,v_ids,arr);
end 
c3 = ones(n,1);
v_ids = cat(2,v_ids,c3);

%assigning grain ids
check =  (v_ids(:,1)-256).^2 + (v_ids(:,2)-256).^2;
grain_ids = double(check >= 25);

%assigning phase number
phase_no = grain_ids ~= 1;
phase_no = phase_no + 1;

%creating the fft file
platefft = cat(2,euler,v_ids,grain_ids, phase_no);
% fid = fopen('platefft.dat', 'w');
% fwrite(fid, platefft);
% fclose(fid);
writematrix(platefft,'platefft.dat','Delimiter',' ');  
type platefft.dat;