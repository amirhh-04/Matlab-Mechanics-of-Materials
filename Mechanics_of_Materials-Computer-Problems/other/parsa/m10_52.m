clc; clear;

P = 345e3; % N
L = 1.8; % m
Le = 2 * L; % m
E = 200e9; % Pa
sigma_all = 120e6; % Pa
e = 6e-3; % m

shape = [41.7, 26.6, 35.9, 31.3];
A = [5320, 3390, 4570, 3970] * 1e-6;
bf = [166, 133, 165, 134] * 1e-3;
Iy = [9.03, 3.32, 7.62, 4.07] * 1e-6;
ry = [41.1, 31.2, 40.9, 32.0] * 1e-3;

Pcr = (pi^2 * E .* Iy) ./ (Le^2);

fprintf('----------------------------------------------------------\n');

sigma_max = zeros(1, length(A));
for i = 1:length(A)
    c = bf(i) / 2;
    ec_over_ry2 = (e * c) / (ry(i)^2);
    sigma_max(i) = (P / A(i)) * (1 + ec_over_ry2 * sec(pi / 2 * sqrt(P / Pcr(i))));

    fprintf('         W200 x %.1f ==> sigma_max = %.1f MPa\n', shape(i), sigma_max(i) / 1e6);
end

distances = abs(sigma_max - sigma_all);
[~, index] = min(distances);
closestNumber = shape(index);
fprintf('-----------------------------------------------------------\n');
fprintf('    Use W200x%.1f ==> sigma_max = %.1f MPa < %.1f MPa\n', closestNumber, sigma_max(index) / 1e6, sigma_all / 1e6);