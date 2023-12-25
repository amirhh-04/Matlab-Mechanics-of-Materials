%%%%%%%%%%%%%%%%%%%%%% Equation 10 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms x y(x);

dy_dx = diff(y, x); % dy/dx
d2y_dx2 = diff(y, x, 2); % d^2y/dx^2

equation = d2y_dx2 + 2*dy_dx - 3*y == 0; % y''' + 2y' - 3y = 0
conditions = [y(0) == 1, dy_dx(0) == 0]; % y(0) = 1, y'(0) = 0

res = dsolve(equation, conditions);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', res);