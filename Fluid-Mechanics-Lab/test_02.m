clc; clear; close all;

% Data from the table
flow_rates = [1000, 1250, 1500, 1750, 2000, 2250, 2500]; % Q in lit/hr
xf_values = [0.016, 0.039, 0.053, 0.090, 0.106, 0.159, 0.195]; % xf in m

% Constants
g = 9.81;          % gravitational acceleration (m/s^2)
A = 7.85e-5;       % Area in m^2
L0 = 0.15;         % Length in m
G = 0.497;         % Given constant
gamma = 998.2;     % water density in kg/m^3

% Conversion of flow rates from lit/hr to m³/s
Wf = flow_rates / (3.6e6); % Flow quantity in m^3/s
Vf = Wf / A;               % Velocity in m/s

% Theoretical Force (Ff)
Ff = (Wf .* Vf .* gamma) / g; % Force in Kg_w

% Experimental Force (F'_f)
F_prime_f = (xf_values / L0) * G; % Experimental force in Kg_w

% Error Percentage Calculation
error_percentage = abs((Ff - F_prime_f) ./ Ff) * 100;

% Display the data in a table with error percentage
test_data_table = table(flow_rates.', xf_values.', Wf.', Vf.', F_prime_f.', Ff.', error_percentage.', 'VariableNames', {'Flow Rate (lit/hr)', 'X_f (m)', 'W_f (m³/s)', 'V_f (m/s)', 'Experimental Force (Kg_w)', 'Theoretical Force (Kg_w)', 'Error Percentage (%)'});
disp(test_data_table);

figure;
plot(F_prime_f, Ff, 'o-', 'LineWidth', 1.5);

hold on;
plot(Ff, Ff, 'r--', 'LineWidth', 1); % Ideal line

xlabel('Experimental Force (Kg_w)');
ylabel('Theoretical Force (Kg_w)');
title('Theoretical Force vs Experimental Force');
grid on;