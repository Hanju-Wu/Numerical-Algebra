function [y] = GS(A,b,y)
D=diag(diag(A));
L=-1*tril(A,-1);
U=-1*triu(A,1);
y=inv(D-L)*U*y+inv(D-L)*b;
end

