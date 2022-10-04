function [x] = gradient(A,b,x,epsilon,kmax)
k=0;
r=b-A*x;
q=r'*r;
while (sqrt(q)>epsilon*norm(b,2))&(k<kmax)
    k=k+1;
    if k==1;
        p=r;
    else
        beta=q/q1;
        p=r+beta*p;
    end
    w=A*p;
    a=q/(p'*w);
    x=x+a*p;
    r=r-a*w;
    q1=q;
    q=r'*r;
end

