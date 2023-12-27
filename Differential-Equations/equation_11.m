%%%%%%%%%%%%%%%%%%%%%% Equation 11 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms x y(x);

dy_dx = diff(y, x);

equation = dy_dx + y == (y^2)*(cos(x) - sin(x));

res = dsolve(equation);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', res);