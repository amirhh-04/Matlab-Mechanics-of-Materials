clc; clear; close all;

% پارامترها
m = 1; % جرم
c = 1; % ضریب دمپر
k = 1; % ضریب فنر

% زمان
t_span = [0 20]; % بازه زمانی شبیه‌سازی
x0 = [0; 0]; % شرایط اولیه: x(0) = 0 و x'(0) = 0

% حل معادله دیفرانسیل با ode45
[t, x] = ode45(@(t, x) mass_spring_damper(t, x, m, c, k), t_span, x0);

% رسم نمودار
figure;
plot(t, x(:,1), 'LineWidth', 2); % رسم x(t)
xlabel('Time (s)');
ylabel('Displacement x(t)');
title('Response of the Mass-Spring-Damper System to Ramp Input');
grid on;

xticks(0:2:20);


% تعریف تابع معادله دیفرانسیل
function dxdt = mass_spring_damper(t, x, m, c, k)
    r_t = t; % تابع رمپ r(t)
    dxdt = zeros(2, 1); % بردار مشتقات
    dxdt(1) = x(2); % x' = x2
    dxdt(2) = (r_t - c*x(2) - k*x(1)) / m; % معادله دیفرانسیل اصلی
end


% clc; clear; close all;
% 
% omega = 1;
% t = linspace(0, 20, 100);
% x_t = -1 + t + exp(-0.5 * t) .* ( (2 * sqrt(3))/3 .* sin(omega * t - 2*pi/3) );
% bb = (sin(omega * t));
% cc = exp(-0.5 * t);
% 
% figure;
% hold on;
% 
% % plot(t, t, 'g--', 'LineWidth', 1);
% % plot(t, bb, 'b.', 'LineWidth', 1);
% % plot(t, cc, 'm.', 'LineWidth', 1);
% % plot(t, -1, 'm.-', 'LineWidth', 1);
% 
% plot(t, x_t, 'LineWidth', 2);
% 
% xlabel('t');
% ylabel('x(t)');
% title('Response of Vibrating System to Ramp Input');
% grid on;
% xticks(0:2:20);