syms x;
y=exp(sin(x)^3+1)-2;
g = matlabFunction(diff(y));
y = matlabFunction(y);
x=-0.72;
for i=1:1000
    x=x-y(x)/g(x);
end
x
x0=-0.72;
x=-0.72;
x=x-y(x)/g(x);
while(abs(x-x0)>0.1^5)
    x0=x;
    x=x-y(x)/g(x);
end
x