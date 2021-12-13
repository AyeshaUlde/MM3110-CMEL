tic
n1 = 1024; n2 = 1024;
arr = zeros(n1,n2);
ng = 500;
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

%generating the final evolved microstructure
arr_new = zeros(n1,n2);
arr_new = arr_new + arr;
for j = 1:n2
    for i = 1:n1
        if arr_new(i,j)==0
            arr_new(i,j) = arr(nn_x(i,j),nn_y(i,j));
        end
    end
end

toc

tic

gbp = 0; % no. of grain boundary pixels, triple point pixels, etc
top = n1*n2; % total number of pixels in the grid

gbp = gbp + 4 + ((n1-2)*2) + ((n1-2)*2); %taking the pixels at the edges of the grid as gbp

%calculating the gbp in each row
for i = 2:1:n1-1
    row = arr_new(i,:);
    [~,~,ix] = unique(row);
    C = accumarray(ix,1).'; %counting the occurence of each grain pixel in a row
    logical_C = C>1; %checking if each grain has more than one pixel in the row
    gsp = length(C) - sum(logical_C);%no. of grains having single pixels in the row  
    %calculating the number of gbp in a row
    if (logical_C(length(C))==0 && logical_C(1)==0)
        rgbp = ((length(C) -1)*2) - gsp + 2;
    elseif (logical_C(length(C))~=0 && logical_C(1)~=0)
        rgbp = ((length(C) -1)*2) - gsp; 
    else
        rgbp = ((length(C) -1)*2) - gsp + 1;
    end
    gbp = gbp + rgbp;
end

fraction_gbp = gbp/top; %Calculating the fraction of grain boundary pixels, triple point pixels, etc
fraction_ig = 1 - fraction_gbp; %Calculating the fraction of grain interior pixels

toc