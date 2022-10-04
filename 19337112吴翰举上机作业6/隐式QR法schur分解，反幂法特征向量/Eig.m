function [r]=Eig(H)
n=length(H);
r=zeros(1,n);
y=zeros(1,n-1);
u=1e-5;
for i=1:n-1
    y(i)=H(i+1,i);
end
m=0;
for i=1:n-1
    if abs(y(i))<u
        m=m+1;
        y(i)=0;
    end
end
z=zeros(1,m);
j=1;
i=1;
while(i<n)
    if abs(y(i))==0
        z(j)=i;
        j=j+1;
    end
    i=i+1;
end
if z(1)==2
    r(1:2)=eig2(H(1:2,1:2));
    j=1;
    while j<m
        if z(j+1)-z(j)==1
            r(z(j+1))=H(z(j+1),z(j+1));
        end
        if(z(j+1)-z(j)==2)
            r((z(j+1)-1):z(j+1))=eig2(H((z(j+1)-1):z(j+1),(z(j+1)-1):z(j+1)));
        end
        j=j+1;
    end
     if n-z(m)==1
        r(n)=H(n,n);
    else
        r(n-1:n)=eig2(H(n-1:n,n-1:n));
    end
else
    r(1)=H(1,1);
    j=1;
    while j<m
        if z(j+1)-z(j)==1
            r(z(j+1))=H(z(j+1),z(j+1));
        end
        if(z(j+1)-z(j)==2)
            r((z(j+1)-1):z(j+1))=eig2(H((z(j+1)-1):z(j+1),(z(j+1)-1):z(j+1)));
        end
        j=j+1;
    end
     if n-z(m)==1
        r(n)=H(n,n);
    else
        r(n-1:n)=eig2(H(n-1:n,n-1:n));
     end
end
r=r';
end
