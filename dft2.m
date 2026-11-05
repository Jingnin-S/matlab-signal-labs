% 高斯信号参数
A = 1;      % 振幅
mu = 0;     % 均值
sigma = 1;  % 标准差

% 采样参数
fs = 1000;      % 采样率
T = 1/fs;       % 采样时间间隔
duration = 1;   % 信号持续时间

% 生成时间向量
t = 0:T:duration-T;

% 生成高斯信号
gaussian_signal = A * exp(-(t-mu).^2 / (2*sigma^2));

% 计算信号长度和DFT
N = length(gaussian_signal);
dft = fft(gaussian_signal);

% 计算频率轴
f = (-fs/2):(fs/N):(fs/2-fs/N);

% 绘制频谱抽样值
plot(f, abs(fftshift(dft)));
xlabel('频率 (Hz)');
ylabel('幅度');
title('高斯信号频谱抽样值');
