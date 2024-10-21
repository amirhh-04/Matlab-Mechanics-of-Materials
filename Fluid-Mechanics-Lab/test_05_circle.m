clc;
clear;
close all;

% تنظیمات کلی نمودار
theta = linspace(0, 2*pi, 100);  % برای رسم دایره
r = 1;  % شعاع دایره

% مختصات دایره
x_circle = r * cos(theta);
y_circle = r * sin(theta);

figure;
hold on;

% رسم دایره
plot(x_circle, y_circle, 'k', 'LineWidth', 2);  % دایره

% افزودن نقطه سکون (جلوی دایره)
stagnation_point = [-r, 0];
plot(stagnation_point(1), stagnation_point(2), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); 

% افزودن دو نقطه جدایش در 82 درجه و -82 درجه
angle_top = deg2rad(82);  % تبدیل 82 درجه به رادیان
angle_bottom = deg2rad(-82);  % تبدیل -82 درجه به رادیان

separation_points_x = [r * cos(angle_top), r * cos(angle_bottom)];  % نقطه جدایش بالا
separation_points_y = [r * sin(angle_top), r * sin(angle_bottom)];  % نقطه جدایش پایین
plot(separation_points_x, separation_points_y, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');

% رسم گردابه‌های پشت دایره (در بیرون از دایره)
vortex_spacing = 0.6;  % فاصله بین گردابه‌ها
for i = 1:4
    vortex_x = r + i * vortex_spacing;  % گردابه‌ها در پشت دایره
    vortex_y = 0.2 * (-1)^i;  % ایجاد نوسان برای گردابه‌ها
    plot(vortex_x, vortex_y, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');  % رسم گردابه
end

% رسم جریان اطراف دایره (حدسی)
x_stream = linspace(-2, 4, 20);  % خطوط جریان در جهت X
y_stream_top = 0.5 * sin(x_stream);  % خط بالا
y_stream_bottom = -0.5 * sin(x_stream);  % خط پایین

plot(x_stream, y_stream_top + 1.2, '--k');  % جریان بالا
plot(x_stream, y_stream_bottom - 1.2, '--k');  % جریان پایین

% تنظیمات نهایی نمودار
axis equal;
xlabel('X (Flow Direction)');
ylabel('Y');
title('Flow Around a Circle with Corrected Separation Points and Vortices');
legend('Model', 'Stagnation Points', 'Separation Points', 'Vortices');
grid on;
hold off;