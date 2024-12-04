clc; clear; close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%% Inputs %%%%%%%%%%%%%%%%%%%%%%%%%%%
v_inf = 30;
kappa = 30;
gamma_vals = [0, 100, 150, 200];
radius = 5;

%%%%%%%%%%%%%%%%%%%%%%%%%%% Initial Calculations %%%%%%%%%%%%%%%%%%%%%%%%%%%
R = sqrt(kappa / (2 * pi * v_inf));
theta = linspace(0, 2 * pi, 360);
r = linspace(0.1, radius, 200);
[theta_mesh, r_mesh] = meshgrid(theta, r);
gamma_len = length(gamma_vals);

%%%%%%%%%%%%%%%%%%%%%%%%%%% Plot Streamlines & Velocity Fields %%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name', 'Uniform, Doublet & Vortex Flow', 'NumberTitle', 'off');

for index = 1:gamma_len
    gamma = gamma_vals(index);

    psi_total = v_inf .* r_mesh .* sin(theta_mesh) .* (1 - (R^2 ./ r_mesh.^2)) - (gamma / (2 * pi)) .* log(r_mesh ./ R);

    [v_r, v_theta] = getVelocityComp(r_mesh, theta_mesh, psi_total);
    [u, v] = polarToCartesianVelocity(v_r, v_theta, theta_mesh);
    [r_stagnation, theta_stagnation] = getStagnationPoints(gamma, v_inf, R, radius);
    [x_stagnation, y_stagnation] = pol2cart(theta_stagnation, r_stagnation);
    [x, y] = pol2cart(theta_mesh, r_mesh);

    subplot(1, 4, index);

    quiver(x, y, u, v, 'b');

    hold on;

    [m, c] = contour(x, y, psi_total, 30);
    c.LineWidth = 1; c.Color = [0, 0.75, 0.75];

    if ~isempty(x_stagnation) && ~isempty(y_stagnation)
        p = plot(x_stagnation, y_stagnation, 'ro');
        p.Marker = 'o'; p.MarkerSize = 4; p.MarkerFaceColor = 'red';
    end

    title(['$\Gamma = ' num2str(gamma) '\, \frac{\mathrm{m}^2}{\mathrm{s}}$'], 'Interpreter', 'latex');
    xlabel('X-axis'); ylabel('Y-axis');
    axis equal; grid on;
    hold off;
end

sgtitle('Combination of Uniform Flow, Doublet and Vortex');

%%%%%%%%%%%%%%%%%%%%%%%%%%% Functions Sec %%%%%%%%%%%%%%%%%%%%%%%%%%%
function [u, v] = polarToCartesianVelocity(v_r, v_theta, theta_mesh)
    u = v_r .* cos(theta_mesh) - v_theta .* sin(theta_mesh);
    v = v_r .* sin(theta_mesh) + v_theta .* cos(theta_mesh);
end

function [v_r, v_theta] = getVelocityComp(r_mesh, theta_mesh, psi_total)
    dr = diff(r_mesh(:, 1));
    dtheta = diff(theta_mesh(1, :));

    dPsi_dR = zeros(size(psi_total));
    for i = 2:size(psi_total, 1) - 1
        dPsi_dR(i, :) = (psi_total(i + 1, :) - psi_total(i - 1, :)) / (2 * dr(1));
    end

    dPsi_dTheta = zeros(size(psi_total));
    for j = 2:size(psi_total, 2) - 1
        dPsi_dTheta(:, j) = (psi_total(:, j + 1) - psi_total(:, j - 1)) / (2 * dtheta(1));
    end

    v_r = dPsi_dTheta ./ r_mesh;
    v_theta = -dPsi_dR;
end

function [r_stagnation, theta_stagnation] = getStagnationPoints(gamma, v_inf, R, radius)
    syms r theta

    val_check = gamma / (4 * pi * v_inf * R);

    if abs(val_check) > 1
        r_stagnation1 = val_check + sqrt(val_check^2 - 1);
        r_stagnation2 = val_check - sqrt(val_check^2 - 1);

        theta_stagnation = pi / 2;

        r_stagnation = [r_stagnation1, r_stagnation2];
        theta_stagnation = [theta_stagnation, theta_stagnation];
    elseif abs(val_check - 1) < 0.005
        theta_stagnation = pi / 2;
        r_stagnation = R;
    elseif abs(val_check) < 1
        theta_stagnation1 = asin(val_check);
        theta_stagnation2 = pi - theta_stagnation1;
        
        r_stagnation = R * ones(1, 2);
        theta_stagnation = [theta_stagnation1, theta_stagnation2];
    else
        psi = v_inf * r * sin(theta) * (1 - (R^2 / r^2)) - (gamma / (2 * pi)) * log(r / R);

        v_r = diff(psi, theta) / r;
        v_theta = -diff(psi, r);

        equations = [v_r == 0, v_theta == 0];
        solutions = solve(equations, [r, theta]);

        r_stagnation = double(solutions.r);
        theta_stagnation = double(solutions.theta);

        valid_indices = ((r_stagnation > 0 | r_stagnation < 0) & r_stagnation <= radius & theta_stagnation >= 0 & theta_stagnation <= (2 * pi)); 

        r_stagnation = r_stagnation(valid_indices);
        theta_stagnation = theta_stagnation(valid_indices);
    end
end