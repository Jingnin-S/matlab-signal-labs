[x,Fs]=audioread("dial.wav");
N=length(x);
t=(0:N-1)/Fs;
plot(t,x);
title('音频信号时域图形')
num=N/Fs/0.2;
a=1;
for i=1:num
a=(i-1)*Fs*0.2+1;
b=i*Fs*0.2;
x1=x(a:b);
N=length(x1);
t=(0:N-1)/Fs;
plot(t,x1);
title(['第',num2str(i),'个号码时域图形']);
fig = figure('Name',num2str(i),'Position',[200+200*a,200,500,500]);
a=a+1;
[X1,f]=ctft1(x1,Fs,N);
plot(f,abs(X1)/max(abs(X1)));
title(['第',num2str(i),'个号码幅度谱']);
axis([0,2000,0,1]);
fig = figure('Name',num2str(i),'Position',[200+200*a,200,500,500]);
a=a+1;
end

function [X, f]=ctft1(x, Fs, N)
X = fftshift(fft(x, N))/Fs;
f = -Fs/2+(0:N-1)*Fs/N;
end
    