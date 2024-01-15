%%%%%%%%%%%%%%%%%%%%%% Equation 19 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms t s x;

equation = int(exp(-x)/x, x, [0 inf]);
laplace_eq  = laplace(equation, t, s);
simplify_res = simplify(laplace_eq);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', simplify_res);