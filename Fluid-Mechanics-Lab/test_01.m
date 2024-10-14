clc; clear; close all;

% Experimental data: These data are given in appropriate units
partially = 1:5; % Indices for partially submerged condition
fully = 6:10;    % Indices for fully submerged condition

% weight_values = [80, 110, 140, 170, 200, 230, 260, 290, 320, 350]; % Weight values for each condition (g)
% h_1 = 7.4; % Fixed reference height (h1) (cm)
% h_2 = [14.05, 14.95, 15.8, 16.65, 17.5, 18.3, 19.15, 19.95, 20.75, 21.55]; % Measured heights (h2) (cm)

% Weight values in grams (g)
weight_values = [80, 110, 140, 170, 200, 230, 260, 290, 320, 350]; % Weight values for each condition (g)

% Height values in centimeters (cm)
h_1 = 7.4; % Fixed reference height (h1) (cm)
h_2 = [14.15, 15.0, 15.85, 16.7, 17.55, 18.25, 19.05, 19.85, 20.65, 21.5]; % Measured heights (h2) (cm)

% Calculating depth (H) for partially and fully submerged conditions
h_all = h_2 - h_1; % Submerged depth H for all conditions (cm)
h_0_fully = h_all(fully) - (10 / 2); % Adjusted depth H0 for fully submerged condition (cm)

% For h_0, we assign NaN for partially submerged rows
h_0 = [NaN(1,5), h_0_fully]; % H0 only applies to fully submerged condition

% Calculating total pressure (P) for both conditions
p_partially = 7.5 .* ((h_all(partially).^2) / 2); % Total pressure P for partially submerged (g)
p_fully = (7.5 * 10) .* h_0_fully; % Total pressure P for fully submerged (g)
p = [p_partially, p_fully]; % Combined pressure data (g)

% Calculating the center of pressure arm length (Lc) for both conditions
l_c_partially = 20 - (h_all(partially) ./ 3); % Arm length Lc for partially submerged condition (cm)
l_c_fully = h_0_fully + (100 ./ (12 .* h_0_fully)) + (20 - h_all(fully)); % Arm length Lc for fully submerged condition (cm)
l_c = [l_c_partially, l_c_fully]; % Combined arm length data (cm)

% Calculating theoretical moment (Mc) for both conditions
m_c_partially = p_partially .* l_c_partially; % Theoretical moment Mc for partially submerged (g.cm)
m_c_fully = p_fully .* l_c_fully; % Theoretical moment Mc for fully submerged (g.cm)
m_c = [m_c_partially, m_c_fully]; % Combined moment data (g.cm)

% Calculating experimental moment (Mm) and experimental arm length (Lm)
m_m_partially = 30 .* weight_values(partially); % Experimental moment Mm for partially submerged (g.cm)
m_m_fully = 30 .* weight_values(fully); % Experimental moment Mm for fully submerged (g.cm)
m_m = [m_m_partially, m_m_fully]; % Combined experimental moment data (g.cm)

l_m_partially = m_m_partially ./ p_partially; % Experimental arm length Lm for partially submerged (cm)
l_m_fully = m_m_fully ./ p_fully; % Experimental arm length Lm for fully submerged (cm)
l_m = [l_m_partially, l_m_fully]; % Combined experimental arm length data (cm)

% Calculating theoretical center of pressure (Cc) for both conditions
c_c_partially = (2/3) .* h_all(partially); % Theoretical center of pressure Cc for partially submerged (cm)
c_c_fully = h_0_fully + (100 ./ (12 .* h_0_fully)); % Theoretical center of pressure Cc for fully submerged (cm)
c_c = [c_c_partially, c_c_fully]; % Combined theoretical center of pressure data (cm)

% Calculating experimental center of pressure (Cm) for both conditions
c_m_partially = l_m_partially + h_all(partially) - 20; % Experimental center of pressure Cm for partially submerged (cm)
c_m_fully = h_all(fully) - (20 - l_m_fully); % Experimental center of pressure Cm for fully submerged (cm)
c_m = [c_m_partially, c_m_fully]; % Combined experimental center of pressure data (cm)

% Calculating error percentage between theoretical and experimental center of pressure
error_percentage = abs((c_c - c_m) ./ c_c) * 100; % Error percentage in center of pressure (%)

% Expanding h_1 to match the size of other variables
h_1_expanded = h_1 * ones(1, length(weight_values)); % Replicate h_1 for display purposes

% Displaying results table
test_data_table = table(weight_values.', h_1_expanded.', h_2.', h_all.', h_0.', p.', l_c.', m_c.', l_m.', m_m.', c_c.', c_m.', error_percentage.', ...
    'VariableNames', {'Weight (g)', 'H_1 (cm)', 'H_2 (cm)', 'H (cm)', 'H_0 (cm)', 'P (g)', 'L_c (cm)', 'M_c (g.cm)', 'L_m (cm)', 'M_m (g.cm)', 'C_c (cm)', 'C_m (cm)', 'Error Percentage (%)'});
disp(test_data_table);

% Plotting theoretical vs. experimental center of pressure
figure;
plot(c_c, c_m, 'bo-', 'LineWidth', 1.5); % Plot experimental vs theoretical data
hold on;
plot(c_c, c_c, 'r--', 'LineWidth', 1); % Plot ideal line (theoretical vs theoretical)
xlabel('Theoretical Center of Pressure (cm)');
ylabel('Experimental Center of Pressure (cm)');
title('Theoretical vs. Experimental Center of Pressure');
grid on;