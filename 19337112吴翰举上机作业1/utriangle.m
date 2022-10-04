function [y] = utriangle(U,y,n)
for j=n:-1:2
    y(j)=y(j)/U(j,j);
    y(1:j-1)=y(1:j-1)-y(j)*U(1:j-1,j);
end
y(1)=y(1)/U(1,1);
end

