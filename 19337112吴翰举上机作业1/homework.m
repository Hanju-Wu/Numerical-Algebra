%%
% <include>ltriangle.m</include>
%
% <include>utriangle.m</include>
%
% <include>square.m</include>
n=100;
A=zeros(n);
D=zeros(n);
A=diag(10*ones(1,n))+diag(ones(1,n-1),-1)+diag(ones(1,n-1),1);
b=ones(n,1);
A=square(A,n);
L=tril(A,-1)+diag(ones(1,n));
D=diag(diag(A));
U=D*L';
y=ltriangle(L,b,n);
x=utriangle(U,y,n)