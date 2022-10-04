function [y] = Jacobi(A,b,y)
D=diag(diag(A));
L=-1*tril(A,-1);
U=-1*triu(A,1);
B=inv(D)*(L+U);
g=inv(D)*b;
y=B*y+g;
end

