function [A,J] = Givens(A,p,q)
n=length(A);
if A(p,q)==0
    c=1;
    s=0;
else
    tao=(A(q,q)-A(p,p))/(2*A(p,q));
    if tao==0
        t=1;
    end
    if tao>0
        t=1/(abs(tao)+sqrt(1+tao^2));
    end
    if tao<0
        t=-1/(abs(tao)+sqrt(1+tao^2));
    end
    c=1/(sqrt(1+t^2));
    s=t*c;
end
ep=zeros(n,1);ep(p)=1;
eq=zeros(n,1);eq(q)=1;
J=eye(n)+(c-1)*(ep*ep'+eq*eq')+s*(ep*eq'-eq*ep');
A=J'*A*J;
end

