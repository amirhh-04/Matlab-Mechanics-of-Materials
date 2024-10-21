clc;
clear;
close all;

% مختصات ساده شده ایرفویل (NACA 0012)
x_airfoil = [1.0000 0.9500 0.9000 0.8000 0.7000 0.6000 0.5000 0.4000 0.3000 0.2000 0.1000 0.0500 0.0000];  % مختصات X
y_airfoil_upper = [0.0000 0.0300 0.0450 0.0600 0.0500 0.0400 0.0300 0.0200 0.0100 0.0050 0.0030 0.0010 0.0000];  % قسمت بالایی ایرفویل
y_airfoil_lower = [0.0000 -0.0300 -0.0450 -0.0600 -0.0500 -0.0400 -0.0300 -0.0200 -0.0100 -0.0050 -0.0030 -0.0010 0.0000];  % قسمت پایینی ایرفویل

% زاویه حمله 30 درجه (تبدیل به رادیان)
aoa = 30;  % زاویه حمله
theta = aoa * pi / 180;  % تبدیل به رادیان

% چرخش ایرفویل برای زاویه حمله
rotation_matrix = [cos(theta) -sin(theta); sin(theta) cos(theta)];
airfoil_upper_rotated = rotation_matrix * [x_airfoil; y_airfoil_upper];
airfoil_lower_rotated = rotation_matrix * [x_airfoil; y_airfoil_lower];

% رسم ایرفویل
figure;
hold on;
plot(airfoil_upper_rotated(1, :), airfoil_upper_rotated(2, :), 'k', 'LineWidth', 2);  % بخش بالایی
plot(airfoil_lower_rotated(1, :), airfoil_lower_rotated(2, :), 'k', 'LineWidth', 2);  % بخش پایینی

% رسم خطوط جریان
x_stream = linspace(-1.5, 1.5, 20);  % نقاط جریان در X
y_stream = 0.2 * sin(x_stream);  % شکل جریان
plot(x_stream - 2, y_stream + 0.1, '--k');  % جریان بالا
plot(x_stream - 2, y_stream - 0.1, '--k');  % جریان پایین

% افزودن نقاط سکون و جدایش
stagnation_point = rotation_matrix * [x_airfoil(1); 0];  % نقطه سکون در لبه جلویی
plot(stagnation_point(1), stagnation_point(2), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
text(stagnation_point(1) - 0.3, stagnation_point(2), 'Stagnation Point', 'Color', 'r');

% نقاط جدایش
separation_point = rotation_matrix * [x_airfoil(end); 0];  % جدایش در لبه انتهایی
plot(separation_point(1), separation_point(2), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
text(separation_point(1) + 0.1, separation_point(2), 'Separation Point', 'Color', 'b');

% تنظیمات نمودار
axis equal;
xlabel('X');
ylabel('Y');
title('Airfoil with 30 Degrees AoA, Streamlines, Stagnation and Separation Points');
grid on;
hold off;