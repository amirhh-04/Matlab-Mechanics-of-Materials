%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear;

f = @(x) sin(x) - (x/2);
a = -2;
b = -1.5;
e = 1e-2;

x = (a + b) / 2;
n = 1;

while abs(f(x)) > e
    x = (a + b) / 2;

    if (f(x) * f(a)) < 0; b = x; else; a = x; end;

    fprintf('  n:%d =>  a: %6.4f  b: %6.4f  x(%d): %.4f  f(x): %6.4f \n', n, a, b, n, x, f(x));
    n = n + 1;
end

fprintf('  The approximated root is x: %6.6f \n', x);