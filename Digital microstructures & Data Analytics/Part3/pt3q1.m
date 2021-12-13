%reading the microstructure image
RGB = imread('m1.jpg');

%converting RGB image to grayscale image
I = rgb2gray(RGB);
figure(1)
imshow(I)
title('Original grayscale microstructure')

%taking I as an array containing data for n samples and d features
s = size(I);
n = s(1); d = s(2);

%standardising/normalizing the data
I = double(I);
mu1 = mean(I,1); %calculating mean for each feature
mu = repmat(mu1,n,1);
I_norm = (I-mu); %normalized I matrix

%performing single value decomposition on I_norm
[U,S,V] = svd(I_norm);

%determining the cumulative variance
S_diag = diag(S);
cv1 = zeros(1,length(S_diag));
for i = 1:length(S_diag)
    x = S_diag(1:i);
    cv1(i) = sum(x.^2);
end
cv1 = cv1/sum(S_diag.^2);
cv = cv1*100;

%plotting the Scree plot
noc = 1:length(S_diag); 
figure(2)
plot(noc,cv,'LineWidth',1.5)
xlabel('Number of principal components', 'FontSize', 24, 'FontName', 'Times New Roman')
ylabel('Cumulative variance %', 'FontSize', 24, 'FontName', 'Times New Roman')
title('Scree plot', 'FontSize', 28, 'FontName', 'Times New Roman')

%reconstructing the image for 10, 25, 50, 75 & 110 principal components
pc = [10,25,50,75,110];  
for k = 1:length(pc)
    i = pc(k);
    Ui = U(:,1:i);
    Si = S(1:i,1:i);
    Vi = V(:,1:i);
    X = Ui*Si*Vi';
    X = X + mu;
    figure(2+k)
    imshow(X,[])
    title(string(i))
end