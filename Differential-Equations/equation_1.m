%%%%%%%%%%%%%%%%%%%%%% Equation 1 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms x y(x);
dy_dx = diff(y, x);
equation = x * dy_dx + y == x * sin(x);

res = dsolve(equation);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', res);