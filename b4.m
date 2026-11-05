w1=800*pi;a=1/20;
num=[2*a*w1 0];
den=[1 2*a*w1 w1*w1];
sys=tf(num,den);

[x,Fs]=audioread('yinjie_GGdiao.wav');
t=(0:length(x)-1)/Fs;
plot(t,x);
y=lsim(sys,x,t);
y1=lsim(sys,x,t);
plot(t,y);
plot(t,y1);
grid on;

title('输出声音信号');
sound(y,Fs);