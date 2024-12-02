clc; clear; close all;

% Initial data
L0 = 0.1;           % Initial length of the specimen in meters
r0 = 0.005;         % Initial radius of the specimen in meters
A0 = pi * r0^2;     % Initial cross-sectional area in square meters

% Applied forces (in Newtons)
forces = [5000, 10000, 15000, 20000, 25000]; 

% Corresponding elongations (in meters)
delta_L = [0.0005, 0.0015, 0.004, 0.007, 0.012]; 

% Additional ultimate and fracture points (demonstrating necking)
forces_fracture = [forces, 24000, 18000];  % Adding ultimate and fracture points
delta_L_fracture = [delta_L, 0.014, 0.015]; % Corresponding elongations

% Calculating stress and strain for tension including necking and fracture points
stress_tension = forces_fracture ./ A0;           % Stress in Pascals (tension)
strain_tension = delta_L_fracture ./ L0;          % Strain (unitless, tension)

% Calculating stress and strain for compression (mirroring tension values)
stress_compression = -stress_tension;    % Stress in Pascals (compression)
strain_compression = -strain_tension;    % Strain (unitless, compression)

% Create a table with the results
test_data_table = table((1:length(forces_fracture))', forces_fracture', repmat(A0, length(forces_fracture), 1), ...
    delta_L_fracture', stress_tension', strain_tension', ...
    'VariableNames', {'Test Number', 'Force (N)', 'Initial Area (m2)', 'Delta Length (m)', 'Stress Tension (Pa)', 'Strain Tension'});

% Display the table
disp(test_data_table);

% Plotting the stress-strain curve
figure;
hold on;

% Plot tension stress-strain data
plot(strain_tension, stress_tension, 'bo-', 'LineWidth', 1.5);

% Plot compression stress-strain data (inverted plot for compression)
plot(strain_compression, stress_compression, 'ro-', 'LineWidth', 1.5);

% Defining the elastic, plastic, and necking regions for tension
elastic_limit_tension = strain_tension(3);  
yield_stress_tension = stress_tension(3);
ultimate_strain_tension = strain_tension(end-2); 
ultimate_stress_tension = stress_tension(end-2);

% Plotting elastic, plastic, and necking regions for tension
plot([0, elastic_limit_tension], [0, yield_stress_tension], 'g--', 'LineWidth', 1.5); % Elastic region (tension)
plot([elastic_limit_tension, ultimate_strain_tension], [yield_stress_tension, ultimate_stress_tension], 'r--', 'LineWidth', 1.5); % Plastic region (tension)
plot([ultimate_strain_tension, strain_tension(end)], [ultimate_stress_tension, stress_tension(end)], 'c--', 'LineWidth', 1.5); % Necking region (tension)

% Marking key points (Yield, Ultimate, and Fracture) for tension
plot(elastic_limit_tension, yield_stress_tension, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'g'); % Yield point (tension)
plot(ultimate_strain_tension, ultimate_stress_tension, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', [0.9290,0.6940, 0.1250]); % Ultimate strength (tension)
plot(strain_tension(end), stress_tension(end), 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k'); % Fracture point (tension)

% Defining the elastic, plastic, and necking regions for compression (mirroring tension values)
elastic_limit_compression = strain_compression(3);  
yield_stress_compression = stress_compression(3);
ultimate_strain_compression = strain_compression(end-2); 
ultimate_stress_compression = stress_compression(end-2);

% Plotting elastic, plastic, and necking regions for compression
plot([0, elastic_limit_compression], [0, yield_stress_compression], 'g--', 'LineWidth', 1.5); % Elastic region (compression)
plot([elastic_limit_compression, ultimate_strain_compression], [yield_stress_compression, ultimate_stress_compression], 'r--', 'LineWidth', 1.5); % Plastic region (compression)
plot([ultimate_strain_compression, strain_compression(end)], [ultimate_stress_compression, stress_compression(end)], 'c--', 'LineWidth', 1.5); % Necking region (compression)

% Marking key points (Yield, Ultimate, and Fracture) for compression
plot(elastic_limit_compression, yield_stress_compression, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'g'); % Yield point (compression)
plot(ultimate_strain_compression, ultimate_stress_compression, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', [0.9290,0.6940, 0.1250]); % Ultimate strength (compression)
plot(strain_compression(end), stress_compression(end), 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k'); % Fracture point (compression)

% Adding axis lines to define quadrants
line([0 0], [min(stress_compression) max(stress_tension)], 'Color', 'k', 'LineWidth', 1); % Y-axis
line([min(strain_compression) max(strain_tension)], [0 0], 'Color', 'k', 'LineWidth', 1); % X-axis

% Graph details
xlabel('Strain');
ylabel('Stress (Pa)');
title('Stress-Strain Curve for Ductile Material (Tension and Compression)');
legend('Tension Data', 'Compression Data', 'Elastic Region', 'Plastic Region', 'Necking Region', 'Yield Point', 'Ultimate Strength', 'Fracture Point', 'Location', 'Best');
grid on;
hold off;