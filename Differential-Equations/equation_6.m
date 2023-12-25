%%%%%%%%%%%%%%%%%%%%%% Equation 6 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms x y(x);

d4y_dx4 = diff(y, x, 4); % d^4y/dx^4
equation = d4y_dx4 == y; % y'''' == y

res = dsolve(equation);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', res);