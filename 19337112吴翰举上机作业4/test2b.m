syms x y;
g=matlabFunction(exp(x*y));
f=matlabFunction(x+y);
N=40;
h=1/N;
a=zeros(1,N-1);
H=[];
for j=1:N-1
    for i=1:N-1
        a(i)=4+h^2*g(i*h,j*h);
    end
    G=diag(a)+diag(-1*ones(1,N-2),1)+diag(-1*ones(1,N-2),-1);
    H=blkdiag(H,G);
end
A=zeros((N-1)*(N-1),(N-1)*(N-1));
A=H+diag(-1*ones(1,(N-2)*(N-1)),N-1)+diag(-1*ones(1,(N-2)*(N-1)),-N+1);
B=zeros(N-1,N-1);
for i=1:N-1
    for j=1:N-1
        B(i,j)=h^2*f(i*h,j*h);
    end
end
B(1,1:N-1)=B(1,1:N-1)+1;B(N-1,1:N-1)=B(N-1,1:N-1)+1;
B(1:N-1,1)=B(1:N-1,1)+1;B(1:N-1,N-1)=B(1:N-1,N-1)+1;
b=B(:);
D=diag(diag(A));
L=-1*tril(A,-1);
U=-1*triu(A,1);
M=inv(D-L)*U;
g=inv(D-L)*b;
GS_x0=zeros((N-1)*(N-1),1);GS_x1=inv(D-L)*U*GS_x0+inv(D-L)*b;
n=1;
while(norm(GS_x0-GS_x1,2)>=10^(-7))
    GS_x0=GS_x1;
    GS_x1=M*GS_x0+g;
    n=n+1;
end
n
Z=zeros((N+1),(N+1));

for j=1:N+1
    Z(1,j)=b0(N*tao,0,(j-1)*h);
    Z(N+1,j)=b0(N*tao,N*h,(j-1)*h);
end
for i=1:N+1
    Z(i,1)=b0(N*tao,(i-1)*h,0*h);
    Z(i,N+1)=b0(N*tao,(i-1)*h,N*h);
end
x=0:h:1;
[X,Y] = meshgrid(x);
surf(X,Y,Z');