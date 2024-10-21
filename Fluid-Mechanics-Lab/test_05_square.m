clc;
clear;
close all;

% مختصات مربع
x_square = [-1 1 1 -1 -1];  % مختصات X
y_square = [-1 -1 1 1 -1];  % مختصات Y

figure;
hold on;

% رسم مربع
plot(x_square, y_square, 'k', 'LineWidth', 2);

% نقاط سکون (کل ضلع سمت چپ)
stagnation_points_x = -1 * ones(1, 10);  % مختصات X نقاط سکون
stagnation_points_y = linspace(-1, 1, 10);  % مختصات Y نقاط سکون
plot(stagnation_points_x, stagnation_points_y, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

% نقاط جدایش (دو گوشه سمت چپ مربع)
separation_points_x = [-1, -1];  % گوشه بالا
separation_points_y = [1, -1];  % گوشه پایین
plot(separation_points_x, separation_points_y, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');

% رسم گردابه‌ها پشت مربع
vortex_spacing = 0.6;
for i = 1:5
    vortex_x = 1 + i * vortex_spacing;
    vortex_y = 0.2 * (-1)^i;
    plot(vortex_x, vortex_y, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
end

% رسم جریان اطراف مربع
x_stream = linspace(-3, 4, 30);
y_stream_top = 0.5 * sin(x_stream);  % جریان بالایی
y_stream_bottom = -0.5 * sin(x_stream);  % جریان پایینی

plot(x_stream, y_stream_top + 2, '--k');  % جریان بالا
plot(x_stream, y_stream_bottom - 2, '--k');  % جریان پایین


axis equal;
xlabel('X (Flow Direction)');
ylabel('Y');
title('Flow Around a Square with Stagnation and Separation Points');
legend('Model', 'Stagnation Points', 'Separation Points', 'Vortices');
grid on;
hold off;