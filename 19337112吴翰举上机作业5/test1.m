n=100;
A=hilb(n);
b=1/3*sum(A,2);
x=zeros(n,1);
x=gradient(A,b,x,1e-4,1000)
r=b-A*x;
norm(r,inf)
