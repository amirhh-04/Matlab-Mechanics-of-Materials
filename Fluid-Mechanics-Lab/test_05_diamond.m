clc;
clear;
close all;

% مختصات لوزی
x_diamond = [-1 0 1 0 -1];  % مختصات X
y_diamond = [0 1 0 -1 0];   % مختصات Y

figure;
hold on;

% رسم لوزی
plot(x_diamond, y_diamond, 'k', 'LineWidth', 2);

% نقطه سکون (گوشه سمت چپ لوزی)
stagnation_point = [-1, 0];
plot(stagnation_point(1), stagnation_point(2), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');

separation_points_x = [0, 0];  % گوشه بالا
separation_points_y = [1, -1];  % گوشه پایین
plot(separation_points_x, separation_points_y, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');

% رسم گردابه‌ها پشت لوزی
vortex_spacing = 0.6;
for i = 1:4
    vortex_x = 1 + i * vortex_spacing;
    vortex_y = 0.2 * (-1)^i;
    plot(vortex_x, vortex_y, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
end

% رسم جریان اطراف لوزی
x_stream = linspace(-3, 4, 30);
y_stream_top = 0.5 * sin(x_stream);  % جریان بالایی
y_stream_bottom = -0.5 * sin(x_stream);  % جریان پایینی

plot(x_stream, y_stream_top + 1.5, '--k');  % جریان بالا
plot(x_stream, y_stream_bottom - 1.5, '--k');  % جریان پایین


axis equal;
xlabel('X (Flow Direction)');
ylabel('Y');
title('Flow Around a Diamond with Stagnation and Separation Points');
legend('Model', 'Stagnation Points', 'Separation Points', 'Vortices');
grid on;
hold off;