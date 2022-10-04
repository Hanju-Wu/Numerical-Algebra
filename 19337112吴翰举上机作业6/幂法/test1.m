%%
% <include>createdC.m</include>
%
% <include>maxroot.m</include>
a1=[3 -5 1]';
u=1e-10;
[u1,lambda1]=maxroot(createdC(a1));
lambda1
eig(createdC(a1))
a2=[-1 -3 0]';
[u2,lambda2]=maxroot(createdC(a2));
lambda2
a3=[-1000 790 -99902 79108.9 9802.08 10891.01 208.01 101]';
[u3,lambda3]=maxroot(createdC(a3));
lambda3