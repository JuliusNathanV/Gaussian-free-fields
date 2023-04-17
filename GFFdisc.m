x = -1:0.005:1;
y = -1:0.005:1;
[X,Y] = meshgrid(x,y);
F = zeros(size(X));
nLim = 75;
mLim = 75;
% for n = 1:nLim
%     for m = -mLim:mLim
%         i = 1;
%         if m < 0
%             i = 2;
%         end
%         [H,lambda] = diskHarmonics(n,abs(m),X,Y,i);
%         a = normrnd(0,1,1);
%         F = F + a*H/sqrt(lambda);
%     end
% end

for m = 0:mLim
%     i = 1;
%     if m < 0
%         i = 2;
%     end
    [H,lambda] = diskHarmonics(nLim,abs(m),X,Y);
    for n = 1:nLim
        a = normrnd(0,1,1);
        b = normrnd(0,1,1);
        F = F + a*H(:,:,n,1)/sqrt(lambda(n));
        if m > 0
            F = F + b*H(:,:,n,2)/sqrt(lambda(n));
        end
    end
end
surf(X,Y,F,'edgecolor','none')