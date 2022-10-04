syms x y t;
b=matlabFunction(exp(-2*t)*sin(2*x+y));
N=20;
h=1/N;
Z=zeros((N+1),(N+1));
for i=1:N+1
    for j=1:N+1
        Z(i,j)=b(1,(i-1)*h,(j-1)*h);
    end
end
x=0:h:1;
[X,Y] = meshgrid(x);
surf(X,Y,Z');