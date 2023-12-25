%%%%%%%%%%%%%%%%%%%%%% Equation 7 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms x y(x);

dy_dx = diff(y, x); % dy/dx
d2y_dx2 = diff(y, x, 2); % d^2y/dx^2

equation = d2y_dx2 + 4*dy_dx + 20*y == 0; % y'' + 4y' + 20*y == y

res = dsolve(equation);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', res);