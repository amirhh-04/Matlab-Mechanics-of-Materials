% #################################################### %
% ################### Analytical ##################### %
% #################################################### %
% clc; clear; close all;

% m = 1;c = 1;k = 1;
% t_span = [0 20]; x0 = [0; 0];

% [t, x] = ode45(@(t, x) mass_spring_damper(t, x, m, c, k), t_span, x0);

% figure;
% plot(t, x(:,1), 'LineWidth', 2);
% xlabel('Time-(s)');
% ylabel('x(t)');
% title('Response of the Mass-Spring-Damper System to Ramp Input');
% grid on;
% xticks(0:2:20);


% function dxdt = mass_spring_damper(t, x, m, c, k)
%     r_t = t;
%     dxdt = zeros(2, 1);
%     dxdt(1) = x(2);
%     dxdt(2) = (r_t - c*x(2) - k*x(1)) / m;
% end

% #################################################### %
% ##################### ODE-45 ####################### %
% #################################################### %
clc; clear; close all;

omega = sqrt(3)/2;
t = linspace(0, 20, 1000);

% x_t = -1 + t + exp(-0.5 * t) .* ((2 * sqrt(3)) / 3 .* sin(omega * t - ((2*pi)/3)));
x_t = exp(-0.5 * t) .* (cos(omega * t) - (1/sqrt(3)) * sin(omega * t)) + (t - 1);

figure;
hold on;
plot(t, x_t, 'LineWidth', 2);
xlabel('t');
ylabel('x(t)');
title('Response of Vibrating System to Ramp Input');
grid on;
xticks(0:2:20);