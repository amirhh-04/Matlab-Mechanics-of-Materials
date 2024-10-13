% مشخصات هواپیما
W = 333400 * 9.81;  % وزن (N)
S = 511;  % مساحت بال (m^2)
CL_max = 1.5;  % ضریب لیفت ماکسیمم
rho0 = 1.225;  % چگالی هوا در سطح دریا (kg/m^3)
g = 9.81;  % شتاب گرانش (m/s^2)

% ارتفاعات مورد نظر (0 تا 15 کیلومتر)
h = linspace(0, 15000, 100);  % ارتفاع‌ها (m)
rho = rho0 .* (1 - 0.0065 .* h / 288.15).^(4.2561);  % چگالی هوا در ارتفاع

% سرعت استال (Stall Speed) برای ارتفاعات مختلف
V_stall = sqrt((2 * W) ./ (rho * S * CL_max));

% سرعت ماکسیمم (Max Speed) - فرض کنید سرعت ماکسیمم در سطح دریا 250 m/s است
V_max_sea_level = 250;  % (m/s)
V_max = V_max_sea_level .* sqrt(rho / rho0);  % کاهش سرعت ماکسیمم با ارتفاع

% رسم نمودار
figure;
plot(V_stall, h / 1000, 'r', 'LineWidth', 2);  % منحنی استال
hold on;
plot(V_max, h / 1000, 'b', 'LineWidth', 2);  % منحنی سرعت ماکسیمم
hold off;

% تنظیمات نمودار
xlabel('سرعت (m/s)');
ylabel('ارتفاع (km)');
title('Flight Envelope (h-V Diagram) for B747-200');
legend('Stall Speed', 'Maximum Speed');
grid on;