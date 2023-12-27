%%%%%%%%%%%%%%%%%%%%%% Equation 15 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms t s;

equation = sin(t); % sin(t)
laplace_eq  = laplace(equation, t, s);
simplify_res = simplify(laplace_eq);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', simplify_res);

