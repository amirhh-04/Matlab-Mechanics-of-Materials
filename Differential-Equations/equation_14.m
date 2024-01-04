%%%%%%%%%%%%%%%%%%%%%% Equation 14 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms x y(x);
equation = x*diff(y, x) + y == -1/x + x*y^2;

res = dsolve(equation);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', simplify(res));