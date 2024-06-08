%%%%%%%%%%%%%%%%%%%%%% P #1 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;


y = @(t) exp(-t/2) .* ( (14/39) * sqrt(3) .* sin(sqrt(3)/2 * t) + (2/13) * cos(sqrt(3)/2 * t) ) - (3/13) * sin(2*t) - (2/13) * cos(2*t);
t = linspace(0, 20, 1000);

yt = y(t);

figure;
plot(t, yt, 'LineWidth', 2);
grid on;