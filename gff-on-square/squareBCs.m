N = 100;
u = linspace(-1,1,N);
% uTrunc = u(2:numel(u)-1);
% [X,Y] = meshgrid(uTrunc,uTrunc);
[X,Y] = meshgrid(u,u);
C = -1i * ellipticF(1i*asinh(sqrt(1i)),-1);
%conformal map from square to circle is sinh(i*am(iCz),-1)/sqrt(i)
%conformal map from circle to H is (i+z)/(1+iz)
%harmonic fn with correct bondary conditions on H is 2*lambda*(arg(z)/pi-1/2)
%composing these will give harmonic function on square w correct bcs

circCoords = sinh(-1i*jacobiAM(1i*C*(X+1i*Y),-1))/sqrt(1i);
hpCoords = (1i + circCoords)./(1+1i*circCoords);
harmFn = 2*angle(hpCoords)/pi()-1;

% figure
% surf(X,Y,harmFn)