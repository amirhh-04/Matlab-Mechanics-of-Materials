% Parameters of the system
mass_ball = 0.5;          % Mass of the ball (kg)
radius_ball = 0.1;        % Radius of the ball (m)
radius_lever = 0.5;       % Radius of the lever (m)
gravity = 9.81;           % Gravitational acceleration (m/s^2)
moment_inertia_ball = 0.4 * mass_ball * radius_ball^2; % Moment of inertia of the ball

% System parameters
K = 1 / (mass_ball * radius_ball^2 + moment_inertia_ball);
omega_n_squared = gravity * mass_ball * radius_lever / (mass_ball * radius_ball^2 + moment_inertia_ball);

% Transfer function G(s)
numerator = [K];
denominator = [1 0 omega_n_squared]; % s^2 + omega_n^2
G_s = tf(numerator, denominator);

% PD controller parameters
Kp = 10;  % Proportional gain
Kd = 5;   % Derivative gain

% PD controller transfer function
C_s = Kp + Kd * tf([1 0], 1);

% Closed-loop transfer function
G_closed = feedback(C_s * G_s, 1);

% Step response of the closed-loop system
figure;
step(G_closed);
title('Step Response of the Closed-Loop System with PD Controller');
xlabel('Time (seconds)');
ylabel('Output (\theta)');
grid on;

% Pole-zero map of the closed-loop system
figure;
pzmap(G_closed);
title('Pole-Zero Map of the Closed-Loop System');
grid on;
