clc; clear; close all;

h = 0.2;
y = linspace(-h, h, 200);
plateDistance = 2 * h;

velocity_values  = [-10, -4, 0, 4, 10];
vValues_len = length(velocity_values);
colors = lines(vValues_len);

figure;
hold on;

for i = 1:vValues_len
    velocity = velocity_values(i);
    prof_u = velocity * (y + 0.2) / (plateDistance / 2);
    plot(prof_u, y, 'Color', colors(i, :), 'LineWidth', 2, 'DisplayName', sprintf('$V = %d \\frac{m}{sec}$', velocity));
end

lg = legend('Interpreter', 'latex');
lg.Location = "Best";
lg.FontSize = 10;

xlabel('u(y)');
ylabel('y');
title('Velocity Profile Between Two Parallel Plates for Different Speeds');

grid on;
hold off;