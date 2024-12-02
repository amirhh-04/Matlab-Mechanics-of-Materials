% Parameters
V_inf = 30;             % Freestream velocity (m/s)
mu = 30;              % Doublet strength (m^2/s)
Gamma_values = [0, 100, 150, 200]; % Circulation values (Γ)
R = sqrt(mu / (pi * V_inf));
theta = linspace(0, 2*pi, 360); % Angular positions (0 to 2*pi)
r = linspace(0.1, 5, 200); % Radial positions (from R to a far distance)
[Theta_mesh, R_mesh] = meshgrid(theta, r); % Meshgrid for polar coordinates

% Preallocate figure
figure;

for k = 1:length(Gamma_values)
    Gamma = Gamma_values(k); % Current circulation value
    
    % Total Stream Function (ψ)
    Psi_total = V_inf .* R_mesh .* sin(Theta_mesh) .* (1 - (R^2 ./ R_mesh.^2)) + (Gamma / (2 * pi)) .* log(R_mesh ./ R);
    
    % Velocity components (v_r and v_theta)
    dPsi_dTheta = V_inf .* R_mesh .* cos(Theta_mesh) .* (1 - (R^2 ./ R_mesh.^2)) - (Gamma / (2 * pi)) .* (1 ./ R_mesh) .* cos(Theta_mesh);
    v_r = dPsi_dTheta ./ R_mesh; % Radial velocity
    
    dPsi_dR = V_inf .* sin(Theta_mesh) .* (1 + (R^2 ./ R_mesh.^2) - 2 * (R^2 ./ R_mesh.^2)) - (Gamma / (2 * pi)) .* (1 ./ R_mesh);
    v_theta = -dPsi_dR; % Tangential velocity
    
    % Convert to Cartesian coordinates for plotting
    U = v_r .* cos(Theta_mesh) - v_theta .* sin(Theta_mesh); % X-component of velocity
    V = v_r .* sin(Theta_mesh) + v_theta .* cos(Theta_mesh); % Y-component of velocity

    [X, Y] = pol2cart(Theta_mesh, R_mesh); % Polar to Cartesian conversion

    % Plot streamlines
    subplot(2, 2, k);
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