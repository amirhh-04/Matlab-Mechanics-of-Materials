%%%%%%%%%%%%%%%%%%%%%% Equation 12 %%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms x y(x);

dy_dx = diff(y, x);
d2y_dx2 = diff(y, x, 2);
d3y_dx3 = diff(y, x, 3);

equation = (x^3)*d3y_dx3 + 8*(x^2)*d2y_dx2 + 15*x*dy_dx + 5*y == x^4 + log(x);

res = dsolve(equation);

fprintf('\n --------------------------------- \n  Result: %s \n --------------------------------- \n', res);