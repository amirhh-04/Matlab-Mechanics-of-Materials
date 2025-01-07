% MATLAB Code to find transfer function from differential equation

% Define symbolic variables
syms s Y(s) U(s) y(t) u(t)

% Define the differential equation in time domain
eqn = diff(y, t, 2) + 6*diff(y, t, 2) + 11*diff(y, t) + 6*y == diff(u, t) + u;

% Apply Laplace transform to the equation
% Assuming initial conditions y(0) = 0, y'(0) = 0
eqn_laplace = laplace(eqn, t, s);
eqn_laplace = subs(eqn_laplace, [laplace(y(t), t, s), laplace(u(t), t, s)], [Y, U]);

% Solve for the transfer function H(s) = Y(s) / U(s)
H = simplify(eqn_laplace);

% Display the transfer function
disp('The transfer function H(s) is:');
disp(H);
