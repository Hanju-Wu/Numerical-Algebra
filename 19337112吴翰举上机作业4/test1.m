%%
% <include>GS.m</include>
%
% <include>Jacobi.m</include>
n=100;
epsilon=10^(-4);
h=1/n;
a=1/2;
A=diag(epsilon*ones(1,n-2),-1)+diag((-2*epsilon-h)*ones(1,n-1))+diag((epsilon+h)*ones(1,n-2),1);
b=zeros(n-1,1);
b(1:n-2,1)=a*h^2;  b(n-1,1)=a*h^2-(epsilon+h);
syms x;
f=(((1-a)/(1-exp(-1/epsilon)))*(1-exp(-x/epsilon)))+a*x;
f=matlabFunction(f);
y=zeros(n-1,1);
for i=1:n-1
    y(i)=f(i*h);
end
J_x0=zeros(n-1,1);J_x1=Jacobi(A,b,J_x0);
while(norm(J_x0-J_x1,Inf)>10^(-4))
    J_x0=J_x1;
    J_x1=Jacobi(A,b,J_x0);
end
GS_x0=zeros(n-1,1);GS_x1=GS(A,b,GS_x0);
while(norm(GS_x0-GS_x1,Inf)>10^(-4))
    GS_x0=GS_x1;
    GS_x1=GS(A,b,GS_x0);
end
J_res2=norm(J_x1-y,2)
J_resInf=norm(J_x1-y,Inf)
GS_res2=norm(GS_x1-y,2)
GS_resInf=norm(GS_x1-y,Inf)
