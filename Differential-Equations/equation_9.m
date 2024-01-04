%%%%%%%%%%%%%%%%%%%%%% Equation 9 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms x y(x);

dy_dx = diff(y, x); % dy/dx
d2y_dx2 = diff(y, x, 2); % d^2y/dx^2

equation = d2y_dx2 + 4*dy_dx + 20*y == 0; % y'' + 4y' + 20*y == y
conditions = [y(0) == 9, dy_dx(0) == 10]; % y(0) = 9, y'(0) = 10

res = dsolve(equation, conditions);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', res);