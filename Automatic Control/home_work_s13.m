% تعریف بازه مقادیر a
a_values = -10:0.1:10; % بازه مقادیر a (می‌توانید تغییر دهید)

% لیست مقادیر پایدار
stable_a = [];

for a = a_values
    % تعریف ضرایب مخرج با مقدار a
    denominator = [1 1 a a];
    
    % محاسبه ریشه‌های مخرج
    poles = roots(denominator);
    
    % بررسی پایداری (تمام قسمت‌های حقیقی منفی باشند)
    if all(real(poles) < 0)
        stable_a = [stable_a, a]; % اضافه کردن a به لیست پایدار
    end
end

% نمایش نتایج
disp('Stable values of a:');
disp(stable_a);

% رسم نمودار
figure;
plot(a_values, zeros(size(a_values)), 'k--'); % خط مبنا=
hold on;
plot(stable_a, zeros(size(stable_a)), 'go', 'MarkerSize', 8, 'LineWidth', 2); % مقادیر پایدار
grid on;

% تنظیمات نمودار
title('Stable Values of a');
xlabel('a');
ylabel('Stability Indicator');
legend('All a values', 'Stable a values');