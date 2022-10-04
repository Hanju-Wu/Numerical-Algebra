function [l,m]=Ifschur(H,u)
n=length(H);
x=0;
y=zeros(1,n-1);
k=0;
for i=1:n-1
    y(i)=H(i+1,i);
end
for i=1:n-1
    if abs(y(i))<(abs(H(i,i))+abs(H(i+1,i+1)))*u
        k=k+1;
        y(i)=0;
    end
end
if k==0
    m=0;
    l=0;
else
    z=zeros(1,k);
    j=1;
    i=1;
    while(i<n)
        if abs(y(i))==0
            z(j)=i;
            j=j+1;
        end
        i=i+1;
    end
    if z(k)<=n-3
        m=0;
        l=z(k);
    else
        i=k;
        while i>1
            if z(i)-z(i-1)<=2
                i=i-1;
            else
                break
            end
        end
        if i>1
            m=n-z(i);
            l=z(i-1);
        end
        if i==1
            if z(1)<=2
                m=n;
                l=0;
            else
                m=n-z(1);
                l=0;
            end
        end
end
end
