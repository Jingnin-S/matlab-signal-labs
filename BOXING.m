% 1. 读取音频文件
audioFile = '101_1b1_Pr_sc_Meditron.wav';  % 请替换为你的音频文件路径
[y, Fs] = audioread(audioFile);

% 2. 绘制时域图像
t = (0:length(y) - 1) / Fs;  % 时间向量
figure;
subplot(2, 1, 1);
plot(t, y);
title('时域波形');
xlabel('时间 (秒)');
ylabel('幅度');

% 3. 绘制频域图像
n = length(y);
f = (-n/2:n/2-1) * Fs / n;  % 频率向量
Y = fftshift(fft(y)) / n;  % 进行FFT，并将结果中心化
Pyy = abs(Y).^2;  % 计算功率谱密度

subplot(2, 1, 2);
plot(f, Pyy);
title('频域分析');
xlabel('频率 (Hz)');
ylabel('功率谱密度');

% 可以根据需要对绘图进行进一步的定制
