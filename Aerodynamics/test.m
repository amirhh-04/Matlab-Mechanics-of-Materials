% Parameters
V_inf = 30;             % Freestream velocity (m/s)
Gamma_values = [0, 50, 100, 150, 200]; % Circulation values (Γ)
R = 1;                  % Radius of the cylinder
mu = V_inf * pi * R^2;  % Strength of the doublet
theta = linspace(0, 2*pi, 360); % Angular positions (0 to 2*pi)
r = linspace(0.01, 5, 200); % Radial positions (from 0.01 to a far distance)
[Theta, R_mesh] = meshgrid(theta, r); % Meshgrid for polar coordinates

% Preallocate figure
figure;

for k = 1:length(Gamma_values)
    Gamma = Gamma_values(k); % Current circulation value
    
    % Total Stream Function (ψ)
    Psi_total = V_inf .* R_mesh .* sin(Theta) .* (1 - (R^2 ./ R_mesh.^2)) ...
                + (Gamma / (2 * pi)) .* log(R_mesh ./ R) ...
                - mu ./ (2 * pi .* R_mesh.^2) .* sin(Theta);
    
    % Velocity components (v_r and v_theta)
    v_r = V_inf .* cos(Theta) .* (1 - (R^2 ./ R_mesh.^2)) - ...
          mu ./ (2 * pi .* R_mesh.^3) .* cos(Theta);
    v_theta = -V_inf .* sin(Theta) .* (1 + (R^2 ./ R_mesh.^2)) + ...
              mu ./ (2 * pi .* R_mesh.^3) .* sin(Theta) + ...
              (Gamma ./ (2 * pi .* R_mesh));
    
    % Convert to Cartesian coordinates for plotting
    [X, Y] = pol2cart(Theta, R_mesh); % Polar to Cartesian conversion
    U = v_r .* cos(Theta) - v_theta .* sin(Theta); % X-component of velocity
    V = v_r .* sin(Theta) + v_theta .* cos(Theta); % Y-component of velocity
    
    % Plot streamlines
    subplot(3, 2, k);
    quiver(X, Y, U, V, 'b'); % Velocity field (arrows)
    hold on;
    contour(X, Y, Psi_total, 50, 'LineWidth', 1); % Streamlines
    
    % Cylinder boundary
    theta_body = linspace(0, 2*pi, 100);
    x_body = R * cos(theta_body);
    y_body = R * sin(theta_body);
    plot(x_body, y_body, 'r-', 'LineWidth', 2); % Cylinder outline
    
    % Labels and formatting
    title(['\Gamma = ', num2str(Gamma), ' m^2/s']);
    xlabel('x');
    ylabel('y');
    axis equal;
    grid on;
    hold off;
end

sgtitle('Flow Field and Streamlines around a Cylinder');
