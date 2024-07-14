clc; clear; close all;

% Parameters
m = 1500;                  % Mass of the car body (kg)
k1 = 80000;                % Suspension stiffness front (N/m)
k2 = 80000;                % Suspension stiffness rear (N/m)
c1 = 3500;                 % Suspension damping coefficient front (N.s/m)
c2 = 3500;                 % Suspension damping coefficient rear (N.s/m)
d = 2.5;                   % Distance between the wheels (m)
b = d / 2;                 % Half of the distance between the wheels (m)
v_m_s = 10;                % Speed of the car (km/h)
v = km_h_To_m_s(v_m_s);    % Speed of the car (m/s)
I = 3000;                  % Moment of inertia (kg.m^2)

% Trapezoidal bump parameters
a = 1;                           % Larger base (m)
b_bump = 0.5;                    % Smaller base (m)
c = 0.1;                         % Height (m)
start_distance = 5;              % Distance from the car's front wheel to the bump start (m)
start_time = start_distance / v; % Time when the front wheel hits the bump

% Time vector
t = 0:0.01:5;

% Road bump input function for front and rear wheels
y_front = @(t) (t > start_time & t < start_time+a/v) .* (c/a) .* (v*t - start_time*v) + ...
               (t >= start_time+a/v & t < start_time+(a+b_bump)/v) .* c + ...
               (t >= start_time+(a+b_bump)/v & t < start_time+2*a/v) .* (-c/a) .* (v*t - (start_time+(a+b_bump)/v)) + ...
               (t >= start_time+2*a/v) * 0;

y_rear = @(t) (t > start_time+d/v & t < start_time+(a+d)/v) .* (c/a) .* (v*(t - d/v - start_time)) + ...
               (t >= start_time+(a+d)/v & t < start_time+(a+b_bump+d)/v) .* c + ...
               (t >= start_time+(a+b_bump+d)/v & t < start_time+(2*a+d)/v) .* (-c/a) .* (v*(t - d/v - start_time) - (a+b_bump)/v) + ...
               (t >= start_time+(2*a+d)/v) * 0;

% ODE system
ode = @(t, X) [X(2);
               (-c1 * (X(2) + b*X(4) - y_front(t)) - k1 * (X(1) + b*X(3) - y_front(t)) ...
               - c2 * (X(2) - b*X(4) - y_rear(t)) - k2 * (X(1) - b*X(3) - y_rear(t))) / m;
               X(4);
               (-c1 * b * (X(2) + b*X(4) - y_front(t)) - k1 * b * (X(1) + b*X(3) - y_front(t)) ...
               + c2 * b * (X(2) - b*X(4) - y_rear(t)) + k2 * b * (X(1) - b*X(3) - y_rear(t))) / I];

% Initial conditions
X0 = [0; 0; 0; 0];

% Solve ODE
[T, X] = ode45(ode, t, X0);

% Convert pitch angle to degrees
pitch_angle_deg = rad2deg(X(:,3));

% Plot results
figure;
subplot(2,1,1);
plot(T, X(:,1));
xlabel('Time (s)');
ylabel('Vertical Displacement of Car Body (m)');
title('Vertical Displacement of Car Body');

subplot(2,1,2);
plot(T, pitch_angle_deg);
xlabel('Time (s)');
ylabel('Angular Displacement (degrees)');
title('Pitch Angle of Car Body');

% Animation
figure;
axis equal;
hold on;
grid on;
xlabel('Horizontal Position (m)');
ylabel('Vertical Position (m)');
title('Car Simulation over Road Bump');
road = plot([-5, 30], [0, 0], 'k', 'LineWidth', 2); % Road
car_length = 5;
car_width = 1.5;
car = patch([-car_length/2, car_length/2, car_length/2, -car_length/2], ...
            [-car_width/2, -car_width/2, car_width/2, car_width/2], 'r'); % Car body
front_wheel = plot(0, 0, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k'); % Front wheel
rear_wheel = plot(0, 0, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k'); % Rear wheel

for i = 1:length(T)
    % Car position and angle
    x_pos = v * T(i);
    y_pos = X(i, 1);
    angle = X(i, 3);
    
    % Calculate the rotation matrix
    R = [cos(angle) -sin(angle); sin(angle) cos(angle)];
    
    % Car corners positions
    car_corners = [-car_length/2, -car_width/2;
                   car_length/2, -car_width/2;
                   car_length/2, car_width/2;
                   -car_length/2, car_width/2]';
               
    rotated_corners = R * car_corners;
    
    % Update car position
    set(car, 'XData', rotated_corners(1, :) + x_pos, 'YData', rotated_corners(2, :) + y_pos);
    
    % Update wheel positions
    front_wheel_pos = R * [b; 0] + [x_pos; y_pos];
    rear_wheel_pos = R * [-b; 0] + [x_pos; y_pos];
    set(front_wheel, 'XData', front_wheel_pos(1), 'YData', front_wheel_pos(2));
    set(rear_wheel, 'XData', rear_wheel_pos(1), 'YData', rear_wheel_pos(2));
    
    % Draw road bump
    bump_x = [start_distance, start_distance + a, start_distance + a + b_bump, start_distance + 2*a];
    bump_y = [0, c, c, 0];
    fill(bump_x, bump_y, 'g');
    
    % Update plot
    drawnow;
    pause(0.01);
end

function m_s = km_h_To_m_s(km_h)
    m_s = km_h * 1000 / 3600;
end
