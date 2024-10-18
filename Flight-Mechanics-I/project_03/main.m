clc; clear; close all;

% Parameters for Boeing 747-200
h_max = 13700; % Maximum ceiling altitude in meters == 44948.82 feet
rho_0 = 1.225; % Air density at sea level (kg/m^3)
g = 9.81; % Gravity acceleration (m/s^2) == 32.174 ft/s^2
W = 377842.444 * g; % Maximum Takeoff Weight (N) == 8.17e6 lbf
S = 511; % Wing surface area (m^2) == 5500 ft^2
CL_max = 1.5; % Maximum lift coefficient for stall

% Altitude and density variations
altitudes_m = linspace(0, h_max, 100); % Altitude range from 0 to ceiling (in meters) == (0 to 44948.82 ft)
altitudes_km = altitudes_m / 1000; % Convert altitudes to kilometers
rho = rho_0 .* (1 - 0.0000226 * altitudes_m).^4.2561; % Air density vs. altitude

% Stall speed vs altitude
V_stall = sqrt(2 * W ./ (rho * S * CL_max)); % Stall speed at different altitudes in m/s

% Plotting
figure;
hold on;

% Plot stall speed
plot(V_stall, altitudes_km, 'r-', 'LineWidth', 2);
text(V_stall(1), 0, 'Stall Speed', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', 'r');

% Plot maximum altitude (Ceiling)
plot([0, max(V_stall) + 250], [h_max/1000, h_max/1000], 'k--', 'LineWidth', 2);
text(max(V_stall), h_max/1000, 'Ceiling', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left', 'Color', 'k');

% Constant Mach Lines
Mach_numbers = [0.9];
for M = Mach_numbers
    V_mach = zeros(size(altitudes_m)); % Initialize Mach speed array
    
    for i = 1:length(altitudes_m)
        if altitudes_m(i) <= 11000
            % Up to 11 km: Use temperature lapse rate in the troposphere
            T = 288.15 - 0.0065 * altitudes_m(i); % Temperature decreases with altitude
            a = sqrt(1.4 * 287 * T); % Speed of sound using temperature
        else
            % Above 11 km: Temperature is constant at -56.5°C (216.65 K)
            a = sqrt(1.4 * 287 * 216.65); % Speed of sound constant above 11 km
        end
        V_mach(i) = M * a; % Mach speed at each altitude
    end
    
    % Plot Mach lines
    plot(V_mach, altitudes_km, '-', 'LineWidth', 1.5, 'Color', [0.4940, 0.1840, 0.5560]);
    text(V_mach(1), 0, sprintf('Const Mach %.1f', M), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', [0.4940, 0.1840, 0.5560]);
end

% Constant EAS Lines (Equivalent Airspeed)
EAS_values = [200]; % Example EAS values in m/s
for V_EAS = EAS_values
    V_TAS = V_EAS ./ sqrt(rho ./ rho_0);
    plot(V_TAS, altitudes_km, '-.', 'LineWidth', 1.5, 'Color', 'blue');
    text(V_TAS(1), 0, sprintf('Const EAS %.0f m/s', V_EAS), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', 'blue');
end

xlabel('True Airspeed (m/s)');
ylabel('Altitude (km)');
title('Flight Envelope (h-V diagram) for Boeing 747-200');
grid on;
hold off;