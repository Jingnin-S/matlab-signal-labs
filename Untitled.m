% 读取音频文件
[sound_data, sample_rate] = audioread('2015-04-03(1).wav');

% 计算音频信号的长度和时间
audio_length = length(sound_data);
duration = audio_length / sample_rate;
time = linspace(0, duration, audio_length);

% 对音频信号进行 FFT
n_fft = 2^nextpow2(audio_length); % 取2的次方数作为FFT长度，可以加快计算速度
sound_fft = fft(sound_data, n_fft);
frequencies = sample_rate * (0:n_fft/2) / n_fft;

% 寻找每隔2秒的主要频率成分
frame_interval = 2 * sample_rate; % 2秒的帧间隔
num_frames = floor(audio_length / frame_interval);
main_frequencies = zeros(1, num_frames);
for i = 1:num_frames
    start_idx = (i - 1) * frame_interval + 1;
    end_idx = min(i * frame_interval, audio_length);
    spectrum_frame = abs(sound_fft(start_idx:end_idx));
    [~, index] = max(spectrum_frame);
    main_frequencies(i) = frequencies(index);
    fprint('%.2f\t',main_freqencies(i))
end

% 对应的时间点
time_points = linspace(0, duration, num_frames);

% 绘制频率随时间变化的图像
figure;
plot(time_points, main_frequencies);
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Frequency vs. Time');

% 输出对应表
fprintf('Time(s)\t\tMain Frequency(Hz)\n');
for i = 1:num_frames
    fprintf('%.2f\t\t%.2f\n', time_points(i), main_frequencies(i));
end
