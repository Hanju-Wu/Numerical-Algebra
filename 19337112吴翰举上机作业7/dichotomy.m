function [lambda,a] = dichotomy(A,m)
l=-1*norm(A,inf);u=norm(A,inf);
kmax=1000;
for k=1:kmax
    r=(l+u)/2;
    if reverse(A,r)>=m
        l=l;
        u=r;
    else
        l=r;
        u=u;
    end
end
lambda=(l+u)/2;
a=Eigenvector(A,lambda,kmax);
end