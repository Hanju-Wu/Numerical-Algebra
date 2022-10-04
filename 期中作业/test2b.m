syms x y t;
u0=matlabFunction(sin(2*x+y));
F=matlabFunction(3*exp(-2*t)*sin(2*x+y));
b0=matlabFunction(exp(-2*t)*sin(2*x+y));
N=20;
tao=1/N;
h=1/N;
a=zeros(1,N-1);
H=[];
for j=1:N-1
    for i=1:N-1
        a(i)=4+h^2/tao;
    end
    G=diag(a)+diag(-1*ones(1,N-2),1)+diag(-1*ones(1,N-2),-1);
    H=blkdiag(H,G);
end
A=zeros((N-1)*(N-1),(N-1)*(N-1));
A=H+diag(-1*ones(1,(N-2)*(N-1)),N-1)+diag(-1*ones(1,(N-2)*(N-1)),-N+1);
B=zeros(N-1,N-1);
for i=1:N-1
    for j=1:N-1
        B(i,j)=h^2*F(1*tao,i*h,j*h)+h^2/tao*u0(i*h,j*h);
    end
end
for i=1:N-1
    B(i,1)=B(i,1)+b0(1*tao,i*h,0);
    B(i,N-1)=B(i,N-1)+b0(1*tao,i*h,N*h);
end
for j=1:N-1
    B(1,j)=B(1,j)+b0(1*tao,0,j*h);
    B(N-1,j)=B(N-1,j)+b0(1*tao,N*h,j*h);
end
x=zeros((N-1)^2,N);
for n=1:N
    n
    b=B(:);
    x(1:(N-1)^2,n)=A\b;
    for i=1:N-1
        for j=1:N-1
            B(i,j)=h^2*F((n+1)*tao,i*h,j*h)+h^2/tao*x((N-1)*(j-1)+i,n);
        end
    end
    for i=1:N-1
        B(i,1)=B(i,1)+b0((n+1)*tao,i*h,0);
        B(i,N-1)=B(i,N-1)+b0((n+1)*tao,i*h,N*h);
    end
    for j=1:N-1
        B(1,j)=B(1,j)+b0((n+1)*tao,0,j*h);
        B(N-1,j)=B(N-1,j)+b0((n+1)*tao,N*h,j*h);
    end
end
Z=zeros((N+1),(N+1));
for j=2:N
    for i=2:N
        Z(i,j)=x((N-1)*(j-2)+i-1,N);
    end
end
for j=1:N+1
    Z(1,j)=b0(N*tao,0,(j-1)*h);
    Z(N+1,j)=b0(N*tao,N*h,(j-1)*h);
end
for i=1:N+1
    Z(i,1)=b0(N*tao,(i-1)*h,0*h);
    Z(i,N+1)=b0(N*tao,(i-1)*h,N*h);
end
u=zeros((N-1)^2,N);
for n=1:N
    for i=1:N-1
        for j=1:N-1
            u((N-1)*(j-1)+i,n)=b0(n*h,i*h,j*h);
        end
    end
end
x=reshape(x,[],1);
u=reshape(u,[],1);
error_1=h^3*norm(u-x,1)
error_2=h^(3/2)*norm(u-x,2)
error_inf=norm(u-x,inf)
x=0:h:1;
[X,Y] = meshgrid(x);
surf(X,Y,Z');