% Parameters
U_inf = 30;           % Freestream velocity (m/s)
mu = 30;              % Doublet strength (m^2/s)
Gamma_values = [0, 100, 150, 200]; % Circulation values

R = sqrt(mu / (pi * U_inf));
x = linspace(-8, 8, 200); % X-axis range
y = linspace(-4, 4, 200); % Y-axis range
[X, Y] = meshgrid(x, y);

% Preallocate for streamline function
figure;
for k = 1:length(Gamma_values)
    Gamma = Gamma_values(k);
    
    % Stream function components
    psi_uniform = U_inf .* Y; % Uniform flow
    psi_doublet = -mu ./ (2 * pi) .* (Y ./ (X.^2 + Y.^2)); % Doublet
    psi_circulation = Gamma ./ (2 * pi) .* log(X.^2 + Y.^2); % Circulation
    
    % Total stream function
    psi_total = psi_uniform + psi_doublet + psi_circulation;
    
    % Plot streamlines
    subplot(2, 2, k);
    contour(X, Y, psi_total, 50); % 50 streamlines
    hold on;
        
    % Add the body streamline (red line)
    theta_body = linspace(0, 2 * pi, 100); % Theta for body streamline
    x_body = R * cos(theta_body); % X-coordinates of the body
    y_body = R * sin(theta_body); % Y-coordinates of the body
    plot(x_body, y_body, 'r-', 'LineWidth', 2); % Plot the body streamline
    

    title(['\Gamma = ', num2str(Gamma), ' m^2/s']);
    xlabel('x');
    ylabel('y');
    axis equal;
    grid on;
end

sgtitle('Streamlines for a Lifting Circular Cylinder');