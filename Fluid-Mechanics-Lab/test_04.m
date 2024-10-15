clc; clear; close all;

% Constants
h_prime = 0.3325;    % Initial height (m)
temp = 20;           % Temperature (C)
w = 5;               % Weight (kg)
t = 29.65;           % Time (s)
d_c = 0.0098;        % Diameter of orifice at vena contracta (m)
h_c = 0.312;         % Height of center of orifice (m)
gama = 998.2;        % Fluid density (kg/m³)
k_s = 3.7 * (10^-5); % Surface roughness (m)
d_0 = 0.013;         % Orifice diameter (m)
g = 9.81;            % Gravitational acceleration (m/s²)

% Calculations
h_0 = h_prime - k_s; % Corrected height (m)
q = w / (gama * t);  % Flow rate (m³/s)
a_0 = (pi / 4) * d_0^2;  % Area of the orifice (m²)
a_c = (pi / 4) * d_c^2;  % Area of the vena contracta (m²)

% Coefficients
c_d_1 = q / (a_0 * sqrt(2 * g * h_0)); % Coefficient of discharge (method 1)
c_v = sqrt(h_c / h_0);                 % Coefficient of velocity
c_c = a_c / a_0;                       % Coefficient of contraction
c_d_2 = c_v * c_c;                     % Coefficient of discharge (method 2)

% Create first row & second row
first_row_data = {h_prime, temp, w, t, d_c, h_c, gama, h_0};
first_row_names = {'Height (m)', 'Temperature (C)', 'Weight (kg)', 'Time (Sec)', 'Diameter d_c (m)', 'h_c (m)', 'γ (kg/m³)', 'h_0 (m)'};
second_row_data = {q, a_0, a_c, c_d_1, c_v, c_c, c_d_2};
second_row_names = {'Flow Rate Q (m³/s)', 'Orifice Area A_0 (m²)', 'Vena Contracta Area A_c (m²)', 'Discharge Coefficient C_d1', 'Velocity Coefficient C_v', 'Contraction Coefficient C_c', 'Discharge Coefficient C_d2'};

% Display the first row
first_table = table(first_row_data.', 'RowNames', first_row_names);
% Display the second row
second_table = table(second_row_data.', 'RowNames', second_row_names);
disp([first_table; second_table]);