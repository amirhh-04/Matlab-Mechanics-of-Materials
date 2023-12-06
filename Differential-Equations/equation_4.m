%%%%%%%%%%%%%%%%%%%%%% Equation 4 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms x y(x);
dy_dx = diff(y, x);
equation = dy_dx * x * log(x) - y == x^2 * (3 * log(x) - 1);

res = dsolve(equation);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', res);