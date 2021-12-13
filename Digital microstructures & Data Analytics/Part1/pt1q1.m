prompt1 = 'This script generates a 2-D microstructure. Enter size of the computational grid as [n1 n2] for a n1*n2 grid';
N = input(prompt1);
n1 = N(1); n2 = N(2);
arr = zeros(n1,n2);

prompt2 = 'Enter the number of grains';
ng = input(prompt2);

prompt3 = 'Enter the 2-D velocity vector as [vx vy]';
v = input(prompt3);
vx = v(1); vy = v(2);

prompt4 = 'Enter the frequency with which the output files should be written'; 
f = input(prompt4);

%initial nucleation
c = ng;
while (c>0)
    x_arr = randi([1 n1]);
    y_arr = randi([1 n2]);
    if arr(x_arr, y_arr)==0
        arr(x_arr, y_arr) = c;
        c = c - 1;
    end
end 
if vx==vy
    filename = 'equiaxed_evol.gif';
else
    filename = 'elongated_evol.gif';
end
figure(1)
imagesc(arr)
colorbar
title('Initial Nucleation')
pbaspect([1 1 1])
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,filename,'gif', 'Loopcount',inf);

%assuming arr as the input matrix, store rows & columns of zero and
%non-zeros entries
[rz,cz] = find(arr==0);
[rnz,cnz] = find(arr~=0);

%store indices of all zero entries 
zero_pts = [rz cz];

%get squared euclidean distances
dists = bsxfun(@minus,rnz,rz.').^2 + bsxfun(@minus,cnz,cz.').^2;

%get all nearest (x,y) indices of nonzeros for each zero entry
[R_idx,C_idx] = find(bsxfun(@eq,min(dists,[],1),dists));
idx = [rnz(R_idx) cnz(R_idx)];

%cut at each shifting position and thus create a cell array, with a
%cell of the indices of non-zero nearest entries for each zero entry 
nearest_nnonzero_pts = mat2cell(idx,histc(C_idx,1:max(C_idx)));

%Getting the indices of the nearest nuclei for each zero entry
nn_x = zeros(n1,n2); nn_y = zeros(n1,n2); 
for i = 1:length(rz)
    idarr = nearest_nnonzero_pts{i};
    s = size(idarr);
    if s(1)==1
        nn_x(rz(i),cz(i)) = idarr(1);
        nn_y(rz(i),cz(i)) = idarr(2);
    else
        nn_x(rz(i),cz(i)) = idarr(1,1);
        nn_y(rz(i),cz(i)) = idarr(1,2);
    end
end

%generating the evolved microstructure at the output frequency entered by
%the user
for t = f:f:f*4
    arr_new = zeros(n1,n2);
    for j = 1:n2
        for i = 1:n1
            if arr(i,j)==0
                condition = ((i-nn_x(i,j))^2/(vx*t)^2) + ((j-nn_y(i,j))^2/(vy*t)^2);
                if condition<1
                    arr_new(i,j) = arr(nn_x(i,j),nn_y(i,j));
                end
            end
        end
    end
    arr_new = arr_new + arr;
    pn = 1 + (t/f);
    figure(pn)
    imagesc(arr_new)
    colorbar
    title(string(t))
    pbaspect([1 1 1])
    frame = getframe(pn);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    imwrite(imind,cm,filename,'gif','WriteMode','append');
end