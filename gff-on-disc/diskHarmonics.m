function [H,eval] = diskHarmonics(n,m,X,Y)
%returns the disk harmonic with dirichlet BCs of level n,m and its eigenvalue.
%   returns eigenfunctions w modes (m,n) = (m,1), ..., (m,n) as an XxYxnx2
%   array, first entry in 4th dimension being cos and second being sin

    H = zeros([size(X),n,2]);
    R = sqrt(X.^2+Y.^2);
    theta = angle(X+1i*Y);
    lambda = besselzero(m,n,1);
    eval = zeros(size(lambda));
%     lambda = lambda(n);
%     t = 0;
%     if type == 2
%         t = pi()/2;
%     end
    C = cos(m*theta);
    S = sin(m*theta);
    for k = 1:n
        l = lambda(k);
        if m == 0
            dJ = -besselj(1, l);
            p = 2*pi();
        else
            dJ = (besselj(m-1,l)-besselj(m+1,l))/2;
            p = pi();
        end
        a = 2/(sqrt(p)*dJ);
        eval(k) = l^2;
        B = besselj(m,l*R);
        H(:,:,k,1) = a*B.*C;
        H(:,:,k,2) = a*B.*S;        
%     if type == 2
%         H = a*besselj(m,lambda*R).*sin(m*theta);
%     else
%         H = a*besselj(m,lambda*R).*cos(m*theta);
    end
%     eval = lambda^2;
end
