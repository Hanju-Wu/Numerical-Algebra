function [v1]=Eigenvector(A,t,kmax)
n=length(A);
epsilon=1e-10;
[L,U,P]=lu(A-(t+epsilon)*eye(n));
z0=ones(n,1);
v1=utriangle(U,ltriangle(L,P*z0,n),n);
[x,i]=max(abs(v1));
x=v1(i);
x0=0;
v1=v1/x;
k=1;
while k<kmax & abs(x0-x)>1e-5
    x0=x;
    z0=v1;
    v1=utriangle(U,ltriangle(L,P*z0,n),n);
    [x,i]=max(abs(v1));
    x=v1(i);
    v1=v1/x;
    k=k+1;
end
end
