%%
% <include>reverse.m</include>
%
% <include>dichotomy.m</include>
%
% <include>Eigenvector.m</include>
%
% <include>utriangle.m</include>
%
% <include>ltriangle.m</include>
n=100;
A=diag(2*ones(1,n))+diag(-1*ones(1,n-1),-1)+diag(-1*ones(1,n-1),1);
[lambda_min,eigenvector_min]=dichotomy(A,1)
[lambda_max,eigenvector_max]=dichotomy(A,n)
