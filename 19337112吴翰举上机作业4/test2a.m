syms x y;
g=matlabFunction(exp(x*y));
f=matlabFunction(x+y);
N=20;
h=1/N;
B=zeros(N-1,N-1);
for i=1:N-1
    for j=1:N-1
        B(i,j)=4+h^2*g(i*h,j*h);
    end
end
A=zeros((N-1)*(N-1),(N-1)*(N-1));
A=diag(B(:))+diag(-1*ones(1,(N-2)*(N-1)),N-1)+diag(-1*ones(1,(N-2)*(N-1)),-N+1)+diag(-1*ones(1,(N-1)*(N-1)-1),-1)+diag(-1*ones(1,(N-1)*(N-1)-1),1);
for i=1:N-2
    A(i*(N-1),i*(N-1)+1)=0;
    A(i*(N-1)+1,i*(N-1))=0;
end
B=zeros(N-1,N-1);
for i=1:N-1
    for j=1:N-1
        B(i,j)=h^2*f(i*h,j*h);
    end
end
C=zeros(N-1,N-1);
C(1,1:N-1)=1;C(N-1,1:N-1)=1;C(1:N-1,N-1)=1;C(1:N-1,1)=1;
C(1,1)=2;C(1,N-1)=2;C(N-1,1)=2;C(N-1,N-1)=2;
B=B+C;
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
    n=n+1
end
%GS_x0=zeros((N-1)*(N-1),1);GS_x1=GS(A,b,GS_x0);
%while(norm(GS_x0-GS_x1,2)>=10^(-7))
%    GS_x0=GS_x1;
%    GS_x1=GS(A,b,GS_x0);
%    n=n+1
%end
Z=ones((N+1),(N+1));
for j=2:N
    Z(2:N,j)=GS_x1((N-1)*(j-2)+1:(N-1)*(j-2)+N-1);
end
x=0:h:1;
[X,Y] = meshgrid(x);
surf(X,Y,Z');