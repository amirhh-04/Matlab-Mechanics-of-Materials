%%%%%%%%%%%%%%%%%%%%%% Flow Combination %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

%%%%%%%%%%%%%%%%%%%%%% Inputs %%%%%%%%%%%%%%%%%%%%%%
v_inf = 30;               % Uniform flow velocity
Lambda_vals = [0, 50, 100, 200]; % Source strength values

%%%%%%%%%%%%%%%%%%%%%% Initial Calculations %%%%%%%%%%%%%%%%%%%%%%
theta = linspace(0, 2*pi, 360); % Angular range
r = linspace(0.1, 5, 200);      % Radial range
[theta_mesh, r_mesh] = meshgrid(theta, r);
Lambda_len = length(Lambda_vals);

%%%%%%%%%%%%%%%%%%%%%% Plot Streamlines & Velocity Fields %%%%%%%%%%%%%%%%%%%%%%
figure;
for index = 1:Lambda_len
    lambda = Lambda_vals(index);

    % Total Stream Function (ψ)
    psi_total = v_inf .* r_mesh .* sin(theta_mesh) + (lambda / (2 * pi)) .* theta_mesh;

    % Calculate velocity components
    [v_r, v_theta] = getVelocityComp(r_mesh, theta_mesh, psi_total);

    % Convert velocities to Cartesian components
    u = v_r .* cos(theta_mesh) - v_theta .* sin(theta_mesh);
    v = v_r .* sin(theta_mesh) + v_theta .* cos(theta_mesh);

    % Find stagnation points
    [r_stagnation, theta_stagnation] = getStagnationPoints(lambda, v_inf);

    % Convert polar coordinates of stagnation points to Cartesian
    [x_stagnation, y_stagnation] = pol2cart(theta_stagnation, r_stagnation);

    % Polar to Cartesian conversion for field
    [x, y] = pol2cart(theta_mesh, r_mesh);

    % Plot velocity field and streamlines
    subplot(1, 4, index);
    quiver(x, y, u, v, 'b'); % Velocity field (arrows)
    hold on;
    contour(x, y, psi_total, 30, 'LineWidth', 1, 'Color', [0, 0.75, 0.75]); % Streamlines

    % Plot stagnation points
    plot(x_stagnation, y_stagnation, 'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'red');

    % Title and labels
    title(['$\Lambda = ' num2str(lambda) '\, \frac{\mathrm{m}^2}{\mathrm{s}}$'], 'Interpreter', 'latex');
    xlabel('X-axis');
    ylabel('Y-axis');
    axis equal;
    grid on;
    hold off;
end

%%%%%%%%%%%%%%%%%%%%%% Functions Sec %%%%%%%%%%%%%%%%%%%%%%
function [v_r, v_theta] = getVelocityComp(r_mesh, theta_mesh, psi_total)
    % Step sizes for numerical differentiation
    dr = diff(r_mesh(:, 1));
    dtheta = diff(theta_mesh(1, :));

    % Numerical derivative of ψ with respect to r
    dPsi_dR = zeros(size(psi_total));
    for i = 2:size(psi_total, 1) - 1
        dPsi_dR(i, :) = (psi_total(i + 1, :) - psi_total(i - 1, :)) / (2 * dr(1));
    end

    % Numerical derivative of ψ with respect to θ
    dPsi_dTheta = zeros(size(psi_total));
    for j = 2:size(psi_total, 2) - 1
        dPsi_dTheta(:, j) = (psi_total(:, j + 1) - psi_total(:, j - 1)) / (2 * dtheta(1));
    end

    % Calculate velocities
    v_r = dPsi_dTheta ./ r_mesh;          % Radial velocity
    v_theta = -dPsi_dR;                   % Tangential velocity
end

function [r_stagnation, theta_stagnation] = getStagnationPoints(Lambda, v_inf)
    % Define symbolic variables
    syms r theta

    % Stream function components
    psi = v_inf * r * sin(theta) + (Lambda / (2 * pi)) * theta;

    % Velocity components
    v_r = diff(psi, theta) / r;       % Radial velocity
    v_theta = -diff(psi, r);          % Tangential velocity

    % Solve for stagnation points (v_r = 0 and v_theta = 0)
    equations = [v_r == 0, v_theta == 0];
    solutions = solve(equations, [r, theta]);

    % Extract solutions
    r_stagnation = double(solutions.r);
    theta_stagnation = double(solutions.theta);
end