function [z] = Gaussian(tho)
tho = 6;
x = linspace(-3*tho,3*tho,6*tho+1);
y = x';
[X,Y]=meshgrid(x,y);

z = exp(-(X.^2+Y.^2)./(2*tho^2));
z = z/sum(sum(z));
end
