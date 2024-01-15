%%%%%%%%%%%%%%%%%%%%%% Equation 20 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms t s x;

equation = 2*exp(x) * int(exp(-t) * cos(t)^2, t, [0 x]);
laplace_eq  = laplace(equation, x, s);
simplify_res = simplify(laplace_eq);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', simplify_res);