function img_feature = wavelet(ori_img)
%ori_img = imread('butterfly.jpg');
%ori_img = double(rgb2gray(ori_img));

s = size(ori_img);
img_feature = zeros(s(1), s(2), 19);

sizeFactor = 2;

G = Gaussian(6);

cnt = 1;
img = conv2(ori_img, G, 'same');
img_feature(:,:,cnt) = img;
cnt = cnt+1;
%img = imresize(img, 1/sizeFactor);
%img = double2gray(img);
%imwrite(img, 'l0.jpg');

% generate wavelet filter
thoLs = [1 3 6];
thetaLs = [0 pi/6 pi/3 pi/2 2*pi/3 5*pi/6];
eta = 4;
width = 18;
flt = zeros(18, width*2+1, width*2+1);
for k = 1:3
    for j = 1:6
        %convolve image with morlet filter
        F = Morlet(thoLs(k), thetaLs(j), eta, width);
        img = conv2(ori_img, F, 'same');
        img = (img.*conj(img)).^0.5;

        %gaussian blur
        cnt
        img = conv2(img, G, 'same');
        img_feature(:,:,cnt) = img;
        cnt = cnt+1;

        %downsample
        %img = imresize(img, 1/sizeFactor);
        %img = double2gray(img);
        %imwrite(img, ['l1_' num2str(k) '_' num2str(j) '.jpg']);
    end
end

