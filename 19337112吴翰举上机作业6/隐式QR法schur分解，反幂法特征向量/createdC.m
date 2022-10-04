function [C] = createdC(a)
n=length(a);
u0=ones(n,1);
C=zeros(n,n);
C=diag(ones(1,n-1),-1);
C(1:n,n)=-a;
end

