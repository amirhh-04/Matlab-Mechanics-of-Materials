clc; clear; close all;

% Initial data
L0 = 0.1;           % Initial length of the specimen in meters
r0 = 0.005;         % Initial radius of the specimen in meters
A0 = pi * r0^2;     % Initial cross-sectional area in square meters

% Applied forces (in Newtons)
forces = [5000, 10000, 15000, 20000, 25000]; 

% Corresponding elongations (in meters) for brittle material
delta_L = [0.0002, 0.0006, 0.001, 0.0013, 0.0015]; 

% Additional ultimate point and fracture point (brittle failure)
forces_fracture = [forces, 24000];  % Adding ultimate point for brittle fracture
delta_L_fracture = [delta_L, 0.0016]; % Corresponding elongation

% Calculating stress and strain for tension including fracture point
stress_tension = forces_fracture ./ A0;           % Stress in Pascals (tension)
strain_tension = delta_L_fracture ./ L0;          % Strain (unitless, tension)

% Calculating stress and strain for compression (higher ultimate strength in compression)
stress_compression = -1.5 * stress_tension;    % Stress in Pascals (compression, assuming higher compressive strength)
strain_compression = -strain_tension;          % Strain (unitless, compression)

% Create a table with the results
test_data_table = table((1:length(forces_fracture))', forces_fracture', repmat(A0, length(forces_fracture), 1), ...
    delta_L_fracture', stress_tension', strain_tension', ...
    'VariableNames', {'Test_Number', 'Force_N', 'Initial_Area_m2', 'Delta_Length_m', 'Stress_Tension_Pa', 'Strain_Tension'});

% Display the table
disp(test_data_table);

% Plotting the stress-strain curve
figure;
hold on;

% Plot tension stress-strain data
plot(strain_tension, stress_tension, 'bo-', 'LineWidth', 1.5);

% Plot compression stress-strain data (inverted plot for compression)
plot(strain_compression, stress_compression, 'ro-', 'LineWidth', 1.5);

% Defining the elastic region and ultimate point for tension
ultimate_strain_tension = strain_tension(end-1); 
ultimate_stress_tension = stress_tension(end-1);

% Plotting elastic region and ultimate point for tension
plot([0, ultimate_strain_tension], [0, ultimate_stress_tension], 'g--', 'LineWidth', 1.5); % Elastic region (tension)

% Marking key points (Ultimate and Fracture) for tension
plot(ultimate_strain_tension, ultimate_stress_tension, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', [0.9290,0.6940, 0.1250]); % Ultimate strength (tension)
plot(strain_tension(end), stress_tension(end), 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k'); % Fracture point (tension)

% Defining the elastic region and ultimate point for compression (mirroring tension values with higher magnitude)
ultimate_strain_compression = strain_compression(end-1); 
ultimate_stress_compression = stress_compression(end-1);

% Plotting elastic region and ultimate point for compression
plot([0, ultimate_strain_compression], [0, ultimate_stress_compression], 'g--', 'LineWidth', 1.5); % Elastic region (compression)

% Marking key points (Ultimate and Fracture) for compression
plot(ultimate_strain_compression, ultimate_stress_compression, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', [0.9290,0.6940, 0.1250]); % Ultimate strength (compression)
plot(strain_compression(end), stress_compression(end), 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k'); % Fracture point (compression)

% Adding axis lines to define quadrants
line([0 0], [min(stress_compression) max(stress_tension)], 'Color', 'k', 'LineWidth', 1); % Y-axis
line([min(strain_compression) max(strain_tension)], [0 0], 'Color', 'k', 'LineWidth', 1); % X-axis

% Graph details
xlabel('Strain');
ylabel('Stress (Pa)');
title('Stress-Strain Curve for Brittle Material (Tension and Compression)');
legend('Tension Data', 'Compression Data', 'Elastic Region', 'Ultimate Strength', 'Fracture Point', 'Location', 'Best');
grid on;
hold off;