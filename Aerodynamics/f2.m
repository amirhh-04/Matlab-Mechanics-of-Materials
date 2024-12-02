% Parameters
U_inf = 30;           % Freestream velocity (m/s)
mu = 30;              % Doublet strength (m^2/s)
Gamma_values = [0, 50, 100, 150, 200]; % Circulation values

% Derived parameters
R = sqrt(mu / (pi * U_inf)); % Radius of the cylinder

% Computational grid
x = linspace(-2, 2, 200); % X-axis range
y = linspace(-2, 2, 200); % Y-axis range
[X, Y] = meshgrid(x, y);

% Convert to polar coordinates
theta = atan2(Y, X);
r = sqrt(X.^2 + Y.^2);

% Preallocate for streamline function
figure;
for k = 1:length(Gamma_values)
    Gamma = Gamma_values(k);
    
    % Stream function
    psi_total = U_inf * r .* sin(theta) .* (1 - (R^2 ./ r.^2)) + ...
                (Gamma / (2 * pi)) * log(r / R);
    
    % Mask inside the cylinder (r < R)
    psi_total(r < R) = NaN; % Set values inside the cylinder to NaN
    
    % Plot streamlines
    subplot(3, 2, k);
    contour(X, Y, psi_total, 50); % 50 streamlines
    hold on;
    
    % Add the cylinder
    theta_body = linspace(0, 2 * pi, 100);
    x_body = R * cos(theta_body);
    y_body = R * sin(theta_body);
    plot(x_body, y_body, 'k-', 'LineWidth', 2); % Cylinder boundary
    
    % Plot formatting
    title(['\Gamma = ', num2str(Gamma), ' m^2/s']);
    xlabel('x');
    ylabel('y');
    axis equal;
    grid on;
    hold off;
end

sgtitle('Streamlines for Combined Flows (Uniform + Doublet + Vortex)');