% % پارامترهای سیستم
% m = 1;           % جرم توپ (کیلوگرم)
% r = 0.1;         % شعاع توپ (متر)
% R = 0.5;         % شعاع لنگر (متر)
% g = 9.81;        % شتاب گرانش (m/s^2)
% I = 0.4 * m * r^2; % ممان اینرسی توپ (کره توخالی)

% % ضرایب معادله
% a = m * r^2 + I; % ضریب شتاب زاویه‌ای
% b = m * g * R;   % ضریب گرانشی

% % تابع تبدیل
% num = [1];       % صورت تابع تبدیل
% den = [a 0 b];   % مخرج تابع تبدیل
% G = tf(num, den);

% % پاسخ پله
% figure;
% step(G);
% title('پاسخ پله سیستم');
% xlabel('زمان (ثانیه)');
% ylabel('زاویه (\theta)');

% % پاسخ فرکانسی
% figure;
% bode(G);
% title('پاسخ فرکانسی سیستم');

% System Parameters
mass_of_ball = 1;           % Mass of the ball (kg)
radius_of_ball = 0.1;       % Radius of the ball (m)
radius_of_lever = 0.5;      % Radius of the lever (m)
gravity = 9.81;             % Gravitational acceleration (m/s^2)
moment_of_inertia = 0.4 * mass_of_ball * radius_of_ball^2; % Moment of inertia of the ball (hollow sphere)

% Coefficients of the equation of motion
angular_acceleration_coefficient = mass_of_ball * radius_of_ball^2 + moment_of_inertia; % Coefficient for angular acceleration
gravity_torque_coefficient = mass_of_ball * gravity * radius_of_lever;   % Coefficient for gravitational torque

% Transfer Function
numerator_coefficients = [1];       % Numerator of the transfer function (constant)
denominator_coefficients = [angular_acceleration_coefficient 0 gravity_torque_coefficient]; % Denominator of the transfer function
transfer_function_model = tf(numerator_coefficients, denominator_coefficients);

% Step Response
figure;
step(transfer_function_model);
title('Step Response of the System');
xlabel('Time (seconds)');
ylabel('Angular Displacement (\theta in radians)');

% Bode Plot (Frequency Response)
figure;
bode(transfer_function_model);
title('Frequency Response (Bode Plot) of the System');