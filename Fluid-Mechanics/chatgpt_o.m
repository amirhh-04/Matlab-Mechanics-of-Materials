% Parameters
plate_distance = 0.4; % Plate distance in meters

% Different Velocities
velocities = [-10, -4, 0, 4, 10]; % Velocity values in m/sec

% Different Viscosities
dpdx_viscosity = -0.03; % Pressure gradient in N/m^2
viscosities = [3.3e-3, 1.8e-3, 3.0e-4]; % Viscosity values in kg/(m.s)

% Different Pressure Gradients
mu_pressure = 0.0003; % Viscosity in kg/(m.s)
pressure_gradients = [0, 0.05, 0.15, 0.25]; % Pressure gradient values in N/m^2

% Velocity Profile Calculation Function
velocity_profile = @(V, y) V * (1 - abs(2*y/plate_distance));

% Shear Stress Profile Calculation Function
shear_stress_profile = @(dpdx, mu, y) (dpdx / (2 * mu)) * (plate_distance^2 / 4 - y.^2);

% Plotting Different Velocities
figure;
subplot(1, 3, 1);
hold on;
for V = velocities
    y = linspace(-plate_distance/2, plate_distance/2, 100);
    u = velocity_profile(V, y);
    plot(u, y, 'DisplayName', ['V = ' num2str(V) ' m/s']);
end
xlabel('u(y)');
ylabel('y');
title('Different Velocity');
legend show;
hold off;

% Plotting Different Viscosities
subplot(1, 3, 2);
hold on;
for mu = viscosities
    y = linspace(-plate_distance/2, plate_distance/2, 100);
    u = shear_stress_profile(dpdx_viscosity, mu, y);
    plot(u, y, 'DisplayName', ['\mu = ' num2str(mu) ' kg/(m.s)']);
end
xlabel('u(y)');
ylabel('y');
title('Different Viscosities');
legend show;
hold off;

% Plotting Different Pressure Gradients
subplot(1, 3, 3);
hold on;
for dpdx = pressure_gradients
    y = linspace(-plate_distance/2, plate_distance/2, 100);
    u = shear_stress_profile(dpdx, mu_pressure, y);
    plot(u, y, 'DisplayName', ['dp/dx = ' num2str(dpdx) ' N/m^2']);
end
xlabel('u(y)');
ylabel('y');
title('Different Pressure Gradients');
legend show;
hold off;

% Overall Figure Title
sgtitle('Velocity Profile Between Two Parallel Plates');
