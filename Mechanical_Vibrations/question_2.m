%%%%%%%%%%%%%%%%%%%%%% Question #2 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

figure;
hold on;

plotODE(@getMyODE, [0 0.4470 0.7410], [0, 10], pi/6);
plotODE(@getMyODE, [0.6350 0.0780 0.1840], [0, 10], 0);

xlabel('time');
ylabel('theta');
title('Plot of the Curve');
legend('θ(0) = π/6', 'θ(0) = 0');
grid on;

function odeData = getMyODE(t, q)
    odeData = (pi/36) * cos(2 * sqrt(5) * t);
end

function plotODE(ode, color, time, condition)
    [t, theta] = ode45(ode, time, condition);
    plot(t, theta, 'LineWidth', 2, 'Color', color);
end