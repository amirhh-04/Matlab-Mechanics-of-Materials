syms y(x);
eqn = diff(y, x, x) - 5*diff(y, x) + 6*y == 0;
dsolve(eqn)

syms y(x);
eqn = diff(y, x, x, x) - 3*diff(y, x, x) + 3*diff(y, x) - y == 0;
dsolve(eqn)

syms y(x);
eqn = diff(y, x, x, x, x) - 2*diff(y, x, x) + y == 0;
dsolve(eqn)