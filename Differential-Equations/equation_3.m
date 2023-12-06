%%%%%%%%%%%%%%%%%%%%%% Equation 3 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms x y(x);
dy_dx = diff(y, x);
equation = (x^2) * dy_dx + x * y == sin(x);

res = dsolve(equation);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', res);