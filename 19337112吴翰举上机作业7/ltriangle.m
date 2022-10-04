function [b] = ltriangle(L,b,n)
for j=1:n-1
    b(j)=b(j)/L(j,j);
    b(j+1:n)=b(j+1:n)-b(j)*L(j+1:n,j);
end
b(n)=b(n)/L(n,n);
end

