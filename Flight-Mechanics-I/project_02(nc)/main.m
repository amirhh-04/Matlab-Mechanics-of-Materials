clc; clear; close all;

% Parameters
altitude = 0:0.5:25; % Altitude in kilometers (from 0 to 25 km, step of 500 meters)
altitude_m = altitude * 1000; % Convert altitude to meters

T_0 = 288.15; % Standard temperature at sea level (Kelvin)
P_0 = 101325; % Standard pressure at sea level (Pa)
rho_0 = 1.225; % Standard air density at sea level (kg/m^3)
g = 9.80665; % Gravity acceleration (m/s^2)
R = 287.05; % Specific gas constant for air (J/(kg·K))
L = 0.0065; % Temperature lapse rate (K/m)

% Temperature variation with altitude
T = T_0 - L * altitude_m; % Temperature (K)
T(altitude > 11) = T(find(altitude <= 11, 1, 'last')); % Keep temperature constant above 11 km

% Pressure and density variations with altitude
P = zeros(size(altitude)); % Pre-allocate pressure array
rho = zeros(size(altitude)); % Pre-allocate density array

for i = 1:length(altitude)
    if altitude(i) <= 11
        % Troposphere (0-11 km)
        P(i) = P_0 * (T(i) / T_0)^(g / (R * L)); % Pressure (Pa)
        rho(i) = rho_0 * (T(i) / T_0)^(g / (R * L) - 1); % Density (kg/m^3)
    else
        % Stratosphere (above 11 km)
        P_11 = P_0 * (216.65 / T_0)^(g / (R * L)); % Pressure at 11 km
        H_11 = 11000; % Height at 11 km in meters
        T_11 = 216.65; % Temperature at 11 km (constant)
        P(i) = P_11 * exp(-g * (altitude_m(i) - H_11) / (R * T_11)); % Exponential decay for pressure
        rho(i) = rho_0 * (P(i) / P_0) * (T_0 / T(i)); % Density relation to pressure
    end
end

% Relative temperature (theta)
theta = T / T_0;

% Relative pressure (delta)
delta = P / P_0;

% Relative density (sigma)
sigma = rho / rho_0;

% Plotting
figure;

% Temperature vs Altitude
subplot(3, 2, 1);
plot(T, altitude, 'r', 'LineWidth', 1.5);
title('Temperature vs Altitude');
xlabel('Temperature (K)');
ylabel('Altitude (km)');
grid on;

% Relative Temperature (theta) vs Altitude
subplot(3, 2, 2);
plot(theta, altitude, 'g', 'LineWidth', 1.5);
title('Relative Temperature (Theta) vs Altitude');
xlabel('Theta (T/T_0)');
ylabel('Altitude (km)');
grid on;

% Pressure vs Altitude
subplot(3, 2, 3);
plot(P * 1e-3, altitude, 'b', 'LineWidth', 1.5);
title('Pressure vs Altitude');
xlabel('Pressure (KPa)');
ylabel('Altitude (km)');
grid on;

% Relative Pressure (delta) vs Altitude
subplot(3, 2, 4);
plot(delta, altitude, 'm', 'LineWidth', 1.5);
title('Relative Pressure (Delta) vs Altitude');
xlabel('Delta (P/P_0)');
ylabel('Altitude (km)');
grid on;

% Density vs Altitude
subplot(3, 2, 5);
plot(rho, altitude, 'k', 'LineWidth', 1.5);
title('Density vs Altitude');
xlabel('Density (kg/m^3)');
ylabel('Altitude (km)');
grid on;

% Relative Density (sigma) vs Altitude
subplot(3, 2, 6);
plot(sigma, altitude, 'c', 'LineWidth', 1.5);
title('Relative Density (Sigma) vs Altitude');
xlabel('Sigma (rho/rho_0)');
ylabel('Altitude (km)');
grid on;

% Adjust the layout
sgtitle('Atmospheric Properties vs Altitude (0-25 km)');
