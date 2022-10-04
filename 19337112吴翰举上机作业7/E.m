function [e] = E(A)
n=length(A);
e=norm(A-diag(diag(A)),'fro');
end