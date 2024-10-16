clc; clear; close all;

% --- Pitot Tube Data ---
l_0 = [125, 145, 165, 185, 205, 225, 245, 265, 285]; % Pitot tube location along the tube (mm)
h_t = 45; % Total height (mm)
h_s = [17, 4, -31, -90, -100, -67, -31, -13, -5]; % Static pressure heights (mm)
h_v = [28, 41, 76, 135, 145, 112, 76, 58, 50]; % Dynamic pressure heights (mm)

% --- Venturi Tube Data ---
h_1 = 19; % Height at point 1 (mm)
h_2 = -101; % Height at point 2 (mm)
delta_h = 119; % Pressure difference height between points (mm)
air_temp = 20; % Air temperature (Celsius)
gama = 1.205; % Specific weight of air (kg/m^3)
vel = 15.1 * 1e-06; % Kinematic viscosity of air (m^2/s)

% Expand variables to match the length of l_0
gama_expanded = gama * ones(1, length(l_0));
vel_expanded = vel * ones(1, length(l_0));
delta_h_expanded = delta_h * ones(1, length(l_0));
h_t_expanded = h_t * ones(1, length(l_0));

% --- Constants ---
l_p = 382; % Pitot tube total length (mm)
k_1 = 1; % Constant for dynamic pressure calculation
g = 9.81; % Gravitational acceleration (m/s^2)
d = 0.03; % Diameter at Venturi tube throat (m)
D = 0.05; % Diameter at Venturi tube inlet (m)
k_2 = 1; % Constant for pressure difference calculation

% --- Calculations ---
l_s = l_p - l_0; % Pitot tube location relative to reference point (mm)
p_v = k_1 .* h_v; % Dynamic pressure (Pa)
v_d = sqrt((2 * g .* p_v) ./ gama_expanded); % Velocity at Venturi throat (m/s)
v_D = sqrt((2 * g .* p_v) ./ gama_expanded); % Velocity at Venturi inlet (m/s)
q_d = (pi/4) * (d^2) .* v_d; % Flow rate at Venturi throat (m^3/s)
q_D = (pi/4) * (D^2) .* v_D; % Flow rate at Venturi inlet (m^3/s)
delta_p = k_2 .* delta_h_expanded; % Pressure difference across the Venturi tube (Pa)
v_m = sqrt((2 * g .* delta_p) ./ gama_expanded); % Average velocity in the Venturi tube (m/s)
a = 1 / sqrt(1 - (d^4 / D^4)); % Correction factor for flow rate
c_j = 0.987; % Coefficient for flow rate
q_m = a * c_j * (pi/4) * (d^2) .* v_m; % Corrected flow rate at the Venturi tube (m^3/s)
re_d = (d .* v_m) ./ vel_expanded; % Reynolds number at Venturi throat
re_D = (D * (q_m / ((pi/4) * D^2))) ./ vel_expanded; % Reynolds number at Venturi inlet

% --- Head Calculations ---
h_d = h_t_expanded - h_s; % Dynamic head calculated as (h_t - h_s)

% --- Create a Table to Display Results ---
ResultsTable = table(l_s.', p_v.', v_d.', v_D.', q_d.', q_D.', delta_p.', v_m.', q_m.', re_d.', re_D.', ...
    'VariableNames', {'l_s', 'p_v', 'v_d', 'v_D', 'q_d', 'q_D', 'delta_p', 'v_m', 'q_m', 're_d', 're_D'});

% Display the table with results
disp(ResultsTable);

% --- Plotting Static, Dynamic, and Total Heads ---
% Create smoother data for plotting curves
l_s_fine = linspace(min(l_s), max(l_s), 100); % Fine locations for smooth curves
h_s_smooth = interp1(l_s, h_s, l_s_fine, 'spline'); % Smooth static head
h_d_smooth = interp1(l_s, h_d, l_s_fine, 'spline'); % Smooth dynamic head
h_t_smooth = interp1(l_s, h_t_expanded, l_s_fine, 'spline'); % Smooth total head (constant)

% --- Plot ---
figure;

% Plot Static Head
plot(l_s_fine, h_s_smooth, 'b-', 'LineWidth', 2); % Static head (blue line)
hold on;

% Plot Dynamic Head
plot(l_s_fine, h_d_smooth, 'r-', 'LineWidth', 2); % Dynamic head (red line)

% Plot Total Head
plot(l_s_fine, h_t_smooth, 'g-', 'LineWidth', 2); % Total head (green line)

% Chart customization
xlabel('Pitot Tube Location (mm)', 'FontSize', 12); % X-axis label
ylabel('Head (mm)', 'FontSize', 12); % Y-axis label
title('Static, Dynamic, and Total Heads vs Pitot Tube Location', 'FontSize', 14); % Chart title
legend('Static Head (h_s)', 'Dynamic Head (h_d)', 'Total Head (h_t)', 'Location', 'best'); % Legend
grid on;
hold off;