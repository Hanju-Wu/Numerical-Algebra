function [a] = eig2(A)
a=zeros(1,2);
derta=(A(1,1)+A(2,2))^2-4*det(A);
a0=1/2*(A(1,1)+A(2,2)+sqrt(derta));
b0=1/2*(A(1,1)+A(2,2)-sqrt(derta));
a(1)=a0;a(2)=b0;
end

