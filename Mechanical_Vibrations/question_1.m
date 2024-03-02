%%%%%%%%%%%%%%%%%%%%%% Question #1 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

time = 0:20;
theta = (pi/36) * cos(2 * sqrt(5) * time);

plot(time, theta, 'LineWidth', 2);

xlabel('time');
ylabel('theta');
title('Plot of the Curve');
grid on;