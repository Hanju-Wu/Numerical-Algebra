function [A] = Hessenberg(A)
n=length(A);
for k=1:n-2
    [v,beta]=house(A(k+1:n,k));
    A(k+1:n,k:n)=(eye(n-k)-beta*v*v')*A(k+1:n,k:n);
    A(1:n,k+1:n)=A(1:n,k+1:n)*(eye(n-k)-beta*v*v');
end
end

