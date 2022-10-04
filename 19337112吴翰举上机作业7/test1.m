%%
% <include>E.m</include>
%
% <include>Givens.m</include>
%
% <include>Jacobi.m</include>
n=50;
A=diag(4*ones(1,n))+diag(ones(1,n-1),1)+diag(ones(1,n-1),-1);
[a,J]=Jacobi(A);
a