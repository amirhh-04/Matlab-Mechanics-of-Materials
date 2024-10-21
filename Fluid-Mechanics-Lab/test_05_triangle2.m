clc;
clear;
close all;

% مختصات مثلث
x_triangle = [1, -1, -1, 1];  % مختصات X برای رسم مثلث
y_triangle = [0, -1, 1, 0];   % مختصات Y برای رسم مثلث

figure;
hold on;

% رسم مثلث با ضلع به سمت جریان
plot(x_triangle, y_triangle, 'k', 'LineWidth', 2);  % رسم مثلث

% افزودن نقاط سکون (کل ضلع سمت چپ)
stagnation_points_x = linspace(-1, -1, 10);
stagnation_points_y = linspace(-1, 1, 10);
plot(stagnation_points_x, stagnation_points_y, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

% افزودن نقاط جدایش (دو گوشه سمت چپ مثلث) در یک خط
separation_points_x = [-1, -1];  % مختصات X برای هر دو نقطه
separation_points_y = [1, -1];   % مختصات Y برای هر دو نقطه

plot(separation_points_x, separation_points_y, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');

vortex_spacing = 0.6;
for i = 1:4
    vortex_x = 1 + i * vortex_spacing;
    vortex_y = 0.2 * (-1)^i;
    plot(vortex_x, vortex_y, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
end

% رسم جریان در اطراف مثلث (حدسی)
x_stream = linspace(-2, 4, 20);  % خطوط جریان در جهت X
y_stream_top = 0.5 * sin(x_stream);  % خط بالا
y_stream_bottom = -0.5 * sin(x_stream);  % خط پایین

plot(x_stream, y_stream_top + 1.2, '--k');  % جریان بالا
plot(x_stream, y_stream_bottom - 1.2, '--k');  % جریان پایین

% تنظیمات نهایی نمودار
axis equal;
xlabel('X (Flow Direction)');
ylabel('Y');
title('Flow Around a Triangle (Base Facing Flow)');
legend('Model', 'Stagnation Points', 'Separation Points', 'Vortices');
grid on;
hold off;