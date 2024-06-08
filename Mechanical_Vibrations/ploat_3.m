%%%%%%%%%%%%%%%%%%%%%% P #3 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

% تعریف متغیرها
zeta_values = [0, 0.2, 0.5, 0.6, 0.8, 1]; % برد مقادیر مختلف میرایی
r = linspace(0, 2, 500); % برد نسبت فرکانس (r = omega / omega_n)
colors = lines(length(zeta_values)); % رنگ‌های مختلف برای هر نمودار

figure;
hold on;

% محاسبه و رسم نمودار اختلاف فاز برای هر مقدار zeta
for i = 1:length(zeta_values)
    zeta = zeta_values(i);
    phi = -atan2(2 * zeta * r, 1 - r.^2); % فرمول اختلاف فاز
    plot(r, phi, 'Color', colors(i, :), 'LineWidth', 2, 'DisplayName', sprintf('\\zeta = %.1f', zeta));
end

% اضافه کردن خط عمودی خط چین در x = 1
y_limits = ylim; % دریافت محدوده y
plot([1 1], y_limits, 'k--', 'LineWidth', 1, 'DisplayName', '(1, +)');

% تنظیمات نمودار
xlabel('r = \omega / \omega_n');
ylabel('\phi');
title('Phase Response for Different Damping Ratios');

legend('Location', 'Best');

grid on;
hold off;