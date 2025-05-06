A=[0 1 0 0;3.47 -0.13 0 0.052;0 0 0 1;0 0 0 -6.23];
B=[0; -2.44; 0; 291.8];
C=[0 0 1 0];
D=0;
tf(ss(A,B,C,D))
figure(1)
set(gcf,'color','w');
plot(w.time,w.data,'k--',y.time,y.data,'k')
grid
xlabel('t(s)');
ylabel('fi(rad)')
legend('referinta','fi simulat')
if exist('w1','var')==0
    return
end
figure(2)
set(gcf,'color','w');
plot(w1.time,w1.data,'k--',y1.time,y1.data,'k')
grid
xlabel('t(s)');
ylabel('fi(rad)')
legend('referinta','fi simulat')