function [a,J] = Jacobi(A)
n=length(A);
u=1e-30;
derta=E(A);
J=eye(n);
while 1
    if derta<=u
        break
    end
    for i=1:n-1
        for j=i+1:n
            if abs(A(i,j))>derta
                [A,J0]=Givens(A,i,j);
                J=J*J0;
            end
        end
    end
    derta=derta/n;
end
a=diag(A);
end