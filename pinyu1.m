t=linspace(0,4,1024);
w1=
H= freqs(b,a,w);
plot(w/(2*pi)/1000,abs(H));
title('幅度响应');
xlabel('频率/kHz');
