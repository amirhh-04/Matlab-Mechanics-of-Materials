%%%%%%%%%%% Flow Combination %%%%%%%%%%%
clc; clear; close all;

% Inputs
v_inf = 30;                     % Uniform flow velocity
kappa = 30;                     % Strength of the doublet
gamma_vals = [0, 100, 150, 200]; % Circulation values (Γ)

R = sqrt(kappa / (2 * pi * v_inf));  % Equivalent cylinder radius

% Grid setup
x_range = linspace(-5, 5, 250); % X-coordinates
y_range = linspace(-5, 5, 250); % Y-coordinates
[x, y] = meshgrid(x_range, y_range);

% Calculations
figure;

for index = 1:length(gamma_vals)
    gamma = gamma_vals(index); % Current circulation value

    % Stream function components
    psiUniform = v_inf * y;                           % Uniform flow
    psiDoublet = -kappa / (2 * pi) * (y ./ (x.^2 + y.^2)); % Doublet flow
    psiVortex = gamma / (2 * pi) * log(x.^2 + y.^2); % Vortex flow

    % Total stream function
    psiTotal = psiUniform + psiDoublet + psiVortex;

    % Plot streamlines
    subplot(1, length(gamma_vals), index);
    contour(x, y, psiTotal, 70, 'LineWidth', 1.1); % Streamlines
    hold on;

    % Add title and labels
    title(['\Gamma = ', num2str(gamma), ' m^2/s']);
    xlabel('X-axis');
    ylabel('Y-axis');
    axis equal;
    grid on;
end