img = imread('butterfly.jpg');
img = double(rgb2gray(img));

thoLs = [1,3,6];
thetaLs = [0, pi/6, pi/4, pi/3, pi/2, 2*pi/3, 3*pi/4, 5*pi/6];

for k = 1:3
    for j = 1:8
        theta = thetaLs(j);
        tho = thoLs(k);
        eta = 4;
        
        %x = linspace(-3*tho,3*tho,6*tho+1);
        x = linspace(-18,18,37);
        y = x';
        [X,Y]=meshgrid(x,y);
        
        first = exp(i*2*pi/(eta*tho)*(cos(theta)*X+sin(theta)*Y)).*exp(-(X.^2+Y.^2)/(2*tho^2));
        second = exp(-(X.^2+Y.^2)/(2*tho^2));
        C2 = sum(sum(first))/sum(sum(second));
        third = first - C2*second;
        C1 = tho/sum(sum((third).*conj(third)))^0.5;
        phi = C1/tho*third;
        phiRe = real(phi);
        phiIm = imag(phi);
        
        imgRe = conv2(img, phiRe);
        imgIm = conv2(img, phiIm);

        imgRe = double2gray(imgRe);
        imgIm = double2gray(imgIm);

        fltRe = double2gray(phiRe);
        fltIm = double2gray(phiIm);

        imwrite(imgRe, ['img_0_' num2str(k) '_' num2str(j) '.jpg']);
        imwrite(imgIm, ['img_1_' num2str(k) '_' num2str(j) '.jpg']);
        imwrite(fltRe, ['flt_0_' num2str(k) '_' num2str(j) '.jpg']);
        imwrite(fltIm, ['flt_1_' num2str(k) '_' num2str(j) '.jpg']);
    end
end

tho = 6;
x = linspace(-3*tho,3*tho,6*tho+1);
y = x';
[X,Y]=meshgrid(x,y);

z = exp(-(X.^2+Y.^2)./(2*tho^2));
z = z/sum(sum(z));

imgBlur = conv2(img, z);
imgBlur = double2gray(imgBlur);

gaussian = double2gray(z);

imwrite(imgBlur, 'imgBlur.jpg');
imwrite(gaussian, 'gaussian.jpg');

