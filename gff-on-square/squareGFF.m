N = 500;
u = linspace(0,1,N);
[X,Y] = meshgrid(u,u);
n = 300;
m = 300;
r = normrnd(0,1,n,m);
Z = zeros(size(X));
for i =1:n
    Z1 = sin(i*pi()*X);
    for j=1:m
        Z2 = sin(j*pi()*Y);
        lambda = sqrt((i*pi())^2+(j*pi())^2);
        Z = Z + r(i,j)*(Z1 .* Z2)/(2*lambda);
    end
end
figure
surf(X,Y,Z,'edgecolor','none')