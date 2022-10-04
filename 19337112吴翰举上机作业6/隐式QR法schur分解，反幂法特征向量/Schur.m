function [r,V,H]=Schur(H,u)
A=H;
n=length(H);
H=Hessenberg(H);
[l,m]=Ifschur(H,u);
k=0;
while m<n
    H22=H(1+l:n-m,1+l:n-m);
    [H22,P]=FrancisQR(H22);
    H(1:l,1+l:n-m)=H(1:l,1+l:n-m)*P;
    H(1+l:n-m,n-m+1:n)=P'*H(1+l:n-m,n-m+1:n);
    H(1+l:n-m,1+l:n-m)=H22;
    [l,m]=Ifschur(H,u);
    k=k+1;
end
[r]=Eig(H);
V=zeros(n);
for j=1:n
    V(1:n,j)=Eigenvector(A,r(j),10);
end
end
