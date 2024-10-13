clc; clear; close all;

% Experimental data: These data are given in appropriate units
partially = 1:5; % Data for partially submerged condition
fully = 6:10;    % Data for fully submerged condition

% Weight values in grams (g)
weight_values = [80, 110, 140, 160, 200, 230, 260, 290, 320, 350]; % W (g)

% Height values in centimeters (cm)
h_1 = 7.4; % h1 (cm)
h_2 = [13.15, 14.0, 15.85, 16.7, 17.55, 18.25, 19.05, 19.85, 20.65, 21.5]; % h2 (cm)

% Calculating depth (H) for partially and fully submerged conditions
h_all = h_2 - h_1; % H (cm)
h_0_fully = h_all(fully) - (10 / 2); % H0 (cm) for fully submerged condition

% For `h_0`, we assign NaN for partially submerged rows
h_0 = [NaN(1,5), h_0_fully];

% Calculating total pressure (P) for both conditions
p_partially = 7.5 .* ((h_all(partially).^2) / 2); % P (g)
p_fully = (7.5 * 10) .* h_0_fully; % P (g)
p = [p_partially, p_fully]; % P (g)

% Calculating the center of pressure arm length (Lc) for both conditions
l_c_partially = 20 - (h_all(partially) ./ 3); % Lc (cm)
l_c_fully = h_0_fully + (100 ./ (12 .* h_0_fully)) + (20 - h_all(fully)); % Lc (cm)
l_c = [l_c_partially, l_c_fully]; % Lc (cm)

% Calculating moment (Mc) for both conditions
m_c = p .* l_c; % Mc (g.cm)

% Calculating experimental moment (Mm) and experimental arm length (Lm)
m_m = 30 .* weight_values; % Mm (g.cm)
l_m = m_m ./ p; % Lm (cm)

% Calculating theoretical center of pressure (Cc) for both conditions
c_c_partially = (2/3) .* h_all(partially); % Cc (cm)
c_c_fully = h_0_fully + (100 ./ (12 .* h_0_fully)); % Cc (cm)
c_c = [c_c_partially, c_c_fully]; % Cc (cm)

% Calculating experimental center of pressure (Cm) for both conditions
c_m_partially = l_m(partially) + h_all(partially) - 20; % Cm (cm)
c_m_fully = h_all(fully) - (20 - l_m(fully)); % Cm (cm)
c_m = [c_m_partially, c_m_fully]; % Cm (cm)

% Calculating error percentage between theoretical and experimental center of pressure
error_percentage = abs((c_c - c_m) ./ c_c) * 100;

% Expanding `h_1` to match the size of other variables
h_1_expanded = h_1 * ones(1, length(weight_values));

% Displaying results table
test_data_table = table(weight_values.', h_1_expanded.', h_2.', h_all.', h_0.', p.', l_c.', m_c.', l_m.', m_m.', c_c.', c_m.', error_percentage.', 'VariableNames', {'Weight (g)', 'H_1 (cm)', 'H_2 (cm)', 'H (cm)', 'H_0 (cm)', 'P (g)', 'L_c (cm)', 'M_c (g.cm)', 'L_m (cm)', 'M_m (g.cm)', 'C_c (cm)', 'C_m (cm)', 'Error Percentage (%)'});
disp(test_data_table);

figure;
plot(c_c, c_m, 'bo-', 'LineWidth', 1.5);

hold on;
plot(c_c, c_c, 'r--', 'LineWidth', 1); % Ideal line

xlabel('Theoretical Center of Pressure (cm)');
ylabel('Experimental Center of Pressure (cm)');
title('Theoretical vs. Experimental Center of Pressure');
grid on;