%%
% <include>createdC.m</include>
%
% <include>Schur.m</include>
%
% <include>Ifschur.m</include>
%
% <include>FrancisQR.m</include>
%
% <include>Eig.m</include>
%
% <include>eig2.m</include>
%
% <include>house.m</include>
%
% <include>Hessenberg.m</include>
%
% <include>Eigenvector.m</include>
%
% <include>utriangle.m</include>
%
% <include>ltriangle.m</include>
u=1e-33;
a=zeros(41,1);
a(1)=1;a(4)=1;
C=createdC(a);
[r0,V0,H0]=Schur(C,u);r0
x=0.9;
A=[9.1 3 2.6 4;4.2 5.3 4.7 1.6;3.2 1.7 9.4 x;6.1 4.9 3.5 6.2];
[r1,V1,H1]=Schur(A,u);r1,V1
x=1;
A=[9.1 3 2.6 4;4.2 5.3 4.7 1.6;3.2 1.7 9.4 x;6.1 4.9 3.5 6.2];
[r2,V2,H2]=Schur(A,u);r2,V2
x=1.1;
A=[9.1 3 2.6 4;4.2 5.3 4.7 1.6;3.2 1.7 9.4 x;6.1 4.9 3.5 6.2];
[r3,V3,H3]=Schur(A,u);r3,V3