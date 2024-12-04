clc; clear; close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%% Inputs %%%%%%%%%%%%%%%%%%%%%%%%%%%
v_inf = 30;
lambda_vals = [0, 50, 100, 200];
radius = 5;

%%%%%%%%%%%%%%%%%%%%%%%%%%% Initial Calculations %%%%%%%%%%%%%%%%%%%%%%%%%%%
theta = linspace(0, 2 * pi, 360);
r = linspace(0.1, radius, 200);
[theta_mesh, r_mesh] = meshgrid(theta, r);
Lambda_len = length(lambda_vals);

%%%%%%%%%%%%%%%%%%%%%%%%%%% Plot Streamlines & Velocity Fields %%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name', 'Uniform & Source Flow', 'NumberTitle', 'off');

for index = 1:Lambda_len
    lambda = lambda_vals(index);

    psi_total = v_inf .* r_mesh .* sin(theta_mesh) + (lambda / (2 * pi)) .* theta_mesh;

    [v_r, v_theta] = getVelocityComp(r_mesh, theta_mesh, psi_total);
    [u, v] = polarToCartesianVelocity(v_r, v_theta, theta_mesh);
    [r_stagnation, theta_stagnation] = getStagnationPoints(lambda, v_inf);
    [x_stagnation, y_stagnation] = pol2cart(theta_stagnation, r_stagnation);
    [x, y] = pol2cart(theta_mesh, r_mesh);

    subplot(1, 4, index);

    quiver(x, y, u, v, 'b');

    hold on;

    [m, c] = contour(x, y, psi_total, 30);
    c.LineWidth = 1; c.Color = [0, 0.75, 0.75];

    plot(x_stagnation, y_stagnation, 'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'red');

    title(['$\Lambda = ' num2str(lambda) '\, \frac{\mathrm{m}^2}{\mathrm{s}}$'], 'Interpreter', 'latex');
    xlabel('X-axis'); ylabel('Y-axis');
    axis equal; grid on;
    hold off;
end

sgtitle('Combination of Uniform Flow and Source');

%%%%%%%%%%%%%%%%%%%%%%%%%%% Functions Sec %%%%%%%%%%%%%%%%%%%%%%%%%%%
function [u, v] = polarToCartesianVelocity(v_r, v_theta, theta_mesh)
    u = v_r .* cos(theta_mesh) - v_theta .* sin(theta_mesh);
    v = v_r .* sin(theta_mesh) + v_theta .* cos(theta_mesh);
end

function [v_r, v_theta] = getVelocityComp(r_mesh, theta_mesh, psi_total)
    dr = diff(r_mesh(:, 1));
    dtheta = diff(theta_mesh(1, :));

    dPsi_dr = zeros(size(psi_total));
    for i = 2:size(psi_total, 1) - 1
        dPsi_dr(i, :) = (psi_total(i + 1, :) - psi_total(i - 1, :)) / (2 * dr(1));
    end

    dPsi_dTheta = zeros(size(psi_total));
    for j = 2:size(psi_total, 2) - 1
        dPsi_dTheta(:, j) = (psi_total(:, j + 1) - psi_total(:, j - 1)) / (2 * dtheta(1));
    end

    v_r = dPsi_dTheta ./ r_mesh;
    v_theta = -dPsi_dr;
end

function [r_stagnation, theta_stagnation] = getStagnationPoints(Lambda, v_inf)
    syms r theta

    psi = v_inf * r * sin(theta) + (Lambda / (2 * pi)) * theta;

    v_r = diff(psi, theta) / r;
    v_theta = -diff(psi, r);

    equations = [v_r == 0, v_theta == 0];
    solutions = solve(equations, [r, theta]);

    r_stagnation = double(solutions.r);
    theta_stagnation = double(solutions.theta);
end