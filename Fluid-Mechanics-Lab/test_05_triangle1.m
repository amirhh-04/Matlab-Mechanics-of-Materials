clc;
clear;
close all;

% مختصات مثلث
x_triangle = [-1, 1, 1, -1];  % مختصات X برای رسم مثلث
y_triangle = [0, 1, -1, 0];   % مختصات Y برای رسم مثلث

figure;
hold on;

% رسم مثلث با نوک به سمت جریان
plot(x_triangle, y_triangle, 'k', 'LineWidth', 2);  % رسم مثلث

% افزودن نقطه سکون (نوک مثلث)
stagnation_point = [-1, 0];
plot(stagnation_point(1), stagnation_point(2), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');

% افزودن نقاط جدایش (دو گوشه سمت راست مثلث)
separation_points_x = [1, 1];  % گوشه بالای سمت راست
separation_points_y = [1, -1];  % گوشه پایین سمت راست
plot(separation_points_x, separation_points_y, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');

vortex_spacing = 0.6;
for i = 1:4
    vortex_x = 1 + i * vortex_spacing;
    vortex_y = 0.2 * (-1)^i;
    plot(vortex_x, vortex_y, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
end

% رسم جریان در اطراف مثلث (حدسی)
x_stream = linspace(-3, 4, 20);  % خطوط جریان در جهت X
y_stream_top = 0.3 * sin(x_stream);  % خط بالا
y_stream_bottom = -0.3 * sin(x_stream);  % خط پایین

plot(x_stream, y_stream_top + 1, '--k');  % جریان بالا
plot(x_stream, y_stream_bottom - 1, '--k');  % جریان پایین

% تنظیمات نهایی نمودار
axis equal;
xlabel('X (Flow Direction)');
ylabel('Y');
title('Flow Around a Triangle (Tip Facing Flow)');
legend('Model', 'Stagnation Points', 'Separation Points', 'Vortices');
grid on;
hold off;