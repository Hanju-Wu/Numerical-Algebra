t=[-1 -0.75 -0.5 0 0.25 0.5 0.75];
b=[1 0.8125 0.75 1 1.3125 1.75 2.3125]';
A=zeros(length(t),3);
for i=1:length(t)
    A(i,1)=(t(i))^2;
    A(i,2)=t(i);
    A(i,3)=1;
end
[m,n]=size(A);
Q=culculateQ(A);
Q1=zeros(m,n);
Q1=Q(1:m,1:n);
c1=Q1'*b;
R=zeros(n);
R=culculateR(A);
x=utriangle(R,c1,n)