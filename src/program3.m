clear
clc
format shortg
Te=0.01;
w0=55;
csi=0.7;
s=tf('s');
Hpc = 291.8 / ( s^2 + 6.23*s)
Hpcd = c2d(Hpc, Te, 'zoh')
Hm = w0^2 / (s^2 + 2*csi*w0*s + w0^2)
Hmd=c2d(Hm, Te, 'zoh')
a1=Hpcd.den{1}(2);
a0=Hpcd.den{1}(3);
K=Hpcd.num{1}(2);
b=Hpcd.num{1}(3)/Hpcd.num{1}(2);
p1=Hmd.den{1}(2);
p0=Hmd.den{1}(3);
R_cu=conv([1 b], [1 -1]);
S_cu=[(p1-a1+1)/K (p0-a0+a1)/K a0/K];
T_cu=conv([1 0], [(1+p1+p0) 0])/K;
A=[K 0 0 1; K*b K 0 (a1-1); 0 K*b K (a0-a1); 0 0 K*b -a0];
B=[(p1-a1+1); (p0-a0+a1); a0; 0];
X=inv(A)*B;
R_fara=conv([1 -1], [1 X(4)]);
S_fara=X(1:3)';
T_fara=conv([1 0 0], (1+p1+p0)/K/(1+b));