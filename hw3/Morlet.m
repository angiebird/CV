function [phi] = Morlet(tho, theta, eta, width)
x = linspace(-width,width,2*width+1);
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
end

