%%%%%%%%%%%%%%%%%%%%%% P #2 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

% Define variables
zeta_values = [1, 0.2, 0.5, 0.6, 0.8]; % Array of different damping ratios
r = linspace(0, 2, 500); % Array of frequency ratio (r = omega / omega_n)
colors = lines(length(zeta_values)); % Different colors for each plot

figure;
hold on;

% Calculate and plot the amplitude ratio for each zeta value
for i = 1:length(zeta_values)
    zeta = zeta_values(i);
    M = 1 ./ sqrt((1 - r.^2).^2 + (2 * zeta * r).^2); % Formula for amplitude ratio
    plot(r, M, 'Color', colors(i, :), 'LineWidth', 2, 'DisplayName', sprintf('\\zeta = %.1f', zeta));
end

% Add a vertical dashed line at x = 1
y_limits = ylim; % Get y-axis limits
plot([1 1], y_limits, 'k--', 'LineWidth', 1, 'DisplayName', '(1, +)');

% Chart settings
xlabel('r = \omega / \omega_n');
ylabel('M');
title('Frequency Response for Different Damping Ratios');

legend('Location', 'Best');

grid on;
hold off;