function [u0,lambda] = maxroot(C)
n=length(C);
u0=ones(n,1);
miu0=0;
y=C*u0;
[miu1,i]=max(abs(y));miu=y(i);
u1=y/miu1;
while (norm(u0-u1,inf)>10^(-10)) & (abs(miu0-miu1)>10^(-10))
    miu0=miu1;
    y=C*u1;
    u0=u1;
    miu1=y(find(abs(y)==norm(y,inf)));
    u1=y/miu1;
end
u0=u1;lambda=miu1;
end

