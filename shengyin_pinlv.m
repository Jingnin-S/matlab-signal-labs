% 读取声音文件
[sound_data, sample_rate] = audioread('2015-04-03(1).wav');

% 对声音信号进行傅里叶变换
n = length(sound_data); % 数据长度
frequencies = fftshift((-n/2:n/2-1)*(sample_rate/n)); % 频率轴
sound_fft = fftshift(fft(sound_data));

% 提取频率信息
% 在这里可以选择感兴趣的频率范围进行分析
% 例如，如果只关心0到5000 Hz的频率范围，可以这样选择：
frequency_range = abs(frequencies) < 5000;
sound_fft = sound_fft(frequency_range);
frequencies = frequencies(frequency_range);

% 画出频谱图
plot(frequencies, abs(sound_fft));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum of Sound Signal');
