%%%%%%%%%%%%%%%%%%%%%% Equation 8 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms t y(t);

dy_dt = diff(y, t); % dy/dt

equation = dy_dt == t * y; % dy/dt == ty
conditions = [y(0) == 1]; % y(0) = 1

res = dsolve(equation, conditions);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', res);