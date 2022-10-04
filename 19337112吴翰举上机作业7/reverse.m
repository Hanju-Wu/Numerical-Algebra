function [s] = reverse(A,miu)
n=length(A);
x=diag(A);
y=zeros(n,1);y(2:n,1)=diag(A,1);
s=0;
q=x(1)-miu;
u=1e-10;
for k=1:n
    if q<0
        s=s+1;
    end
    if k<n
        if q==0
            q=abs(y(k+1))*u;
        end
        q=x(k+1)-miu-y(k+1)^2/q;
    end
end
end

