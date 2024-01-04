%%%%%%%%%%%%%%%%%%%%%% Equation 18 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms s x y(x);

dy_dx = diff(y, x);

d2y_dx2 = diff(y, x, 2);

laplace_eq  = laplace(x*(d2y_dx2) + dy_dx + x*(y), x, s);
equation = x*(d2y_dx2) + dy_dx + x*(y) == 0;
conditions = [y(0) == 1];

res = dsolve(equation, conditions);
simplify_res = simplify(res);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', simplify_res);