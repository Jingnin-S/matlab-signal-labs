a=1/20;w1=800*pi;
num= [2*a*800*pi];
den=[1,2*a*800*pi,640000*pi];
sys=tf(num,den);
t=0:0.02:5;
w=0:0.02:5;
set(gcf,'color','w');
figure(1);
pzmap(sys);
p=pole(sys);
z=zero(sys);
H=freqs(num,den,w);
figure(2);
plot(w,abs(H));
title('幅度响应');
figure(3);
plot(w,angle(H));
title('相位响应');
figure(4);
[x,Fs]=audioread('yinjie_GGdiao.wav');

F=laplace(Fs);
Y=F*H;
Yt=ilaplace(Y);
fplot(Yt,[0,10]);
grid on;
title('响应')
