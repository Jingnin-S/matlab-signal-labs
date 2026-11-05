[x,Flam]=audioread("Yourn.wav"); %读取
load model01.mat; %读取数据
sys=tf(num,den);%连续时间lti系统模型
t=linspace(0,20,220500);%建立微分方程，产生0-20之间的220500条矢量
y=lsim(sys,x,t);%求解零状态响应
sound(y,Flam);%播放
audiowrite('1.wav',y,Flam);%生成音频文件
