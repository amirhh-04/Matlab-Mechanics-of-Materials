clc; clear; close all;

h = 0.2;
y = linspace(-h, h, 200);
plateDistance = 2 * h;

dp_dx = -3.0e-2;
mu_values = [3.3e-3, 1.8e-3, 3.0e-4];
muValues_len = length(mu_values);
colors = lines(muValues_len);

figure;
hold on;

for i = 1:muValues_len
    mu = mu_values(i);
    u_prof = (1 / (2 * mu)) * dp_dx * (y.^2 - (plateDistance / 2)^2);
    plot(u_prof, y, 'Color', colors(i, :), 'LineWidth', 2, 'DisplayName', sprintf('$\\mu = %.1e \\frac{kg}{m.sec}$', mu));
end

lg = legend('Interpreter', 'latex');
lg.Location = "Best";
lg.FontSize = 10;

xlabel('u(y)');
ylabel('y');
title('Velocity Profile between Two Parallel Plates for Different Viscosities');

grid on;
hold off;