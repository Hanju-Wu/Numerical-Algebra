function [A,d] = QR(A)
[m,n]=size(A);
d=zeros(n,1);
for j=1:n
    if j<m
        v=zeros(1,m-j+1);
        beta=0;
        [v,beta]=house(A(j:m,j));
        A(j:m,j:n)=(eye(m-j+1)-beta*v*v')*A(j:m,j:n);
        d(j)=beta;
        A(j+1:m,j)=v(2:m-j+1);
    end
end
end

