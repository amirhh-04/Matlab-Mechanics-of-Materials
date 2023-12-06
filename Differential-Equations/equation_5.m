%%%%%%%%%%%%%%%%%%%%%% Equation 5 %%%%%%%%%%%%%%%%%%%%%%
% data = 2*x*y + 3 , x^2 + 8*y
clc; clear;

syms x y

m_data = input("(M) Data [=> (...)dx]: ");
n_data = input("(N) Data [=> (...)dy]: ");

derivative_n = diff(n_data, x);
derivative_m = diff(m_data, y);

if ~(derivative_n == derivative_m); disp('no no no , This is a Shit :/'); return; end;

integral_m = int(m_data, x);
integral_n = int(n_data, y);

res = integral_m + integral_n;
simplified_res = simplify(res);

fprintf('\n --------------------------------- \n   ∂M/∂y = ∂N/∂x = %s \n   ∫M dx ==> ∫(%s)dx = %s \n   ∫N dy ==> ∫(%s)dy = %s \n   Result: %s = C \n --------------------------------- \n', derivative_n, m_data, integral_m, n_data, integral_n, simplified_res);