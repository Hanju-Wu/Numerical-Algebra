function [Q] = culculateQ(A)
[m,n]=size(A);
d=zeros(n,1);
Q=eye(m);
[A,d]=QR(A);
for k=1:n
    H1=zeros(m-k+1);
    v=zeros(m-k+1,1);
    v(1)=1;
    v(2:m-k+1)=A(k+1:m,k);
    H1=eye(m-k+1)-d(k)*v*v';
    H=blkdiag(eye(k-1),H1);
    Q=Q*H;
end
end

