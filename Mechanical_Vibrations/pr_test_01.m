% Parameters
m = 1;      % Mass (kg)
k = 100;    % Spring stiffness (N/m)
c = 10;     % Damping coefficient (N.s/m)

% Time vector
t = 0:0.01:10;

% Initial conditions
x0 = 0.1;   % Initial displacement (m)
v0 = 0;     % Initial velocity (m/s)
X0 = [x0; v0];

% ODE system
ode = @(t, X) [X(2); 
               -(c/m)*X(2) - (k/m)*X(1)];

% Solve ODE
[T, X] = ode45(ode, t, X0);

% Plot results
figure;

subplot(2, 1, 1);
plot(T, X(:,1));
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Displacement of Mass-Spring-Damper System');
grid on;

subplot(2, 1, 2);
plot(T, X(:,2));
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity of Mass-Spring-Damper System');
grid on;
