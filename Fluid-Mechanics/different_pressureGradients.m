clc; clear; close all;

h = 0.2;
y = linspace(-h, h, 200);
plateDistance = 2 * h;

mu = 0.0003;
dp_dx_values = [0.0, 0.05, 0.15, 0.25]; 
dValues_len = length(dp_dx_values);
colors = lines(dValues_len);

figure;
hold on;

for i = 1:dValues_len
    dp_dx = dp_dx_values(i);
    u_prof = (1 / (2 * mu)) * dp_dx * (y.^2 - (plateDistance / 2)^2);
    plot(u_prof, y, 'Color', colors(i, :), 'LineWidth', 2, 'DisplayName', sprintf('$\\frac{\\partial p}{\\partial x}$ = %.2f', dp_dx));
end

lg = legend('Interpreter', 'latex');
lg.Location = "Best";
lg.FontSize = 10;

xlabel('u(y)');
ylabel('y');
title('Velocity Profile between Two Parallel Plates for Different Pressure Gradients');

grid on;
hold off;