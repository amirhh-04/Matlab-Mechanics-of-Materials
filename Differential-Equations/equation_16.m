%%%%%%%%%%%%%%%%%%%%%% Equation 16 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms t s;

equation = exp(3*t)*(2*cos(5*t) - 3*sin(5*t)); % e^3t (2*cos(5t) - 3*sin(5t))
laplace_eq  = laplace(equation, t, s);
simplify_res = simplify(laplace_eq);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', simplify_res);

