%%%%%%%%%%%%%%%%%%%%%% Equation 2 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms x y(x);
dy_dx = diff(y, x);
equation = (x^2) * dy_dx + x * y == 1;

res = dsolve(equation);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', res);