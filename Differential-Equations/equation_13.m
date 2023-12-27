%%%%%%%%%%%%%%%%%%%%%% Equation 13 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms x y(x);

dy_dx = diff(y, x);

equation = 4*(x^2)*y(x)*dy_dx == 9*x*(y^2) + 6*x + 54*(y^6) + 108*(y^4) + 72*(y^2) + 16;

res = dsolve(equation);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', simplify(res));