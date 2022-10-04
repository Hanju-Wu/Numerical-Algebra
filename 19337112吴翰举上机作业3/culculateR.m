function [R] = culculateR(A)
[m,n]=size(A);
d=zeros(n,1);
[A,d]=QR(A);
R=zeros(n);
for j=1:n
    for i=1:j
        R(i,j)=A(i,j);
    end
end
end

