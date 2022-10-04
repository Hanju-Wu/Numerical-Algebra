syms x;
y=(x^3-x^2+5)^0.5-3;
diff(y)
g = matlabFunction(diff(y));
y = matlabFunction(y);
x=2.1;
for i=1:1000
    x=x-y(x)/g(x);
end
x
x0=2.1;
x=2.1;
x=x-y(x)/g(x);
while(abs(x-x0)>0.1^5)
    x0=x;
    x=x-y(x)/g(x);
end
x