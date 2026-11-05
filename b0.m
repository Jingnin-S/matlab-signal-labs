a1=1/15;a2=1/20;a3=1/25;
w1=600*pi;w2=800*pi;w3=1000*pi;
num= [2*a2*w3];
den=[1,2*a2*w3,w3*w3];
sys=tf(num,den);
t=0:0.02:5;
w=0:0.02:5;
set(gcf,'color','w');
figure(1);
pzmap(sys);
p1=pole(sys);
z1=zero(sys);
H=freqs(num,den,w);
figure(2);
plot(w,abs(H));
title('幅度响应');
figure(3);
plot(w,angle(H));
title('相位响应');


