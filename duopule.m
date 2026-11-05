% 信号频率
fc = 3.5e9; % Hz

% 列车速度
v = 350 * 1000 / 3600; % m/s

% 光速
c = 3e8; % m/s

% 计算直射径多普勒频移
fd = fc * v / c; % Hz

% 列车位置的变化
% 假设列车从0位置开始移动，直到某个位置
train_positions = 0:100:10000; % 0到10000米，步长为100米

% 直射径多普勒频移的值将始终为fd，因此我们创建一个与列车位置数量相同的数组
doppler_shifts = ones(size(train_positions)) * fd;

% 绘制图表
plot(train_positions, doppler_shifts, 'b');
xlabel('列车位置（米）');
ylabel('直射径多普勒频移（Hz）');
title('直射径多普勒频移随列车位置变化的图表');
grid on;
