syms x y;
g=matlabFunction(x^2+y^2);
f=matlabFunction(sin(x*y));
N=20;
h=1/N;
a=zeros(1,N-1);
H=[];
for j=1:N-1
    for i=1:N-1
        a(i)=1+h^2/4;
    end
    G=diag(a)+diag(-1/4*ones(1,N-2),1)+diag(-1/4*ones(1,N-2),-1);
    H=blkdiag(H,G);
end
A=zeros((N-1)*(N-1),(N-1)*(N-1));
A=H+diag(-1/4*ones(1,(N-2)*(N-1)),N-1)+diag(-1/4*ones(1,(N-2)*(N-1)),-N+1);
B=zeros(N-1,N-1);
for i=1:N-1
    for j=1:N-1
        B(i,j)=h^2/4*f(i*h,j*h);
    end
end
for i=1:N-1
    B(i,1)=B(i,1)+1/4*g(i*h,0);
    B(i,N-1)=B(i,N-1)+1/4*g(i*h,N*h);
end
for j=1:N-1
    B(1,j)=B(1,j)+1/4*g(0,j*h);
    B(N-1,j)=B(N-1,j)+1/4*g(N*h,j*h);
end
b=B(:);
x=zeros((N-1)^2,1);
x=gradient(A,b,x,1e-4,1000);
Z=zeros((N+1),(N+1));
for j=2:N
    for i=2:N
        Z(i,j)=x((N-1)*(j-2)+i-1);
    end
end
for j=1:N+1
    Z(1,j)=g(0,(j-1)*h);
    Z(N+1,j)=g(N*h,(j-1)*h);
end
for i=1:N+1
    Z(i,1)=g((i-1)*h,0*h);
    Z(i,N+1)=g((i-1)*h,N*h);
end
x=reshape(x,[],1);
u=reshape(u,[],1);
error_1=h^3*norm(u-x,1)
error_2=h^(3/2)*norm(u-x,2)
error_inf=norm(u-x,inf)
x=0:h:1;
[X,Y] = meshgrid(x);
surf(X,Y,Z');