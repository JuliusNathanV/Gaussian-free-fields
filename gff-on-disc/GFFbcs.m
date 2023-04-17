% clear i
x = -1:0.005:1;
y = -1:0.005:1;
[X,Y] = meshgrid(x,y);
L = sqrt(pi()/8);
Z = X+1i*Y;
W = -1i*(Z+1i)./(Z-1i);
W = L*(2*angle(W) - pi())/pi();
% surf(X,Y,W,'edgecolor','none')

