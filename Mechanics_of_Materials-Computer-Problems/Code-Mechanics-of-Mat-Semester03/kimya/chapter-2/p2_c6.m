clc; clear; close all;

nums = input(" n (6, 12, 60): "); % [6, 12, 60]
P = input(" P (N): "); % 1000;
L = input(" L (m): "); % 10;
c = input(" c (m): "); % 1;
E = input(" E (GPa): "); % 200e9;

delta_ex = (P * L) / (2 * pi * c^2 * E);

for i = 1:length(nums)
    n = nums(i);
    delta_a = 0;

    for j = 1:n
        len = (j - 0.5) * (L / n);
        r = 2 * c - c * (len / L);
        a = pi * r^2;
        delta_a = delta_a + (P * (L / n)) / (a * E);
    end

    percent = 100 * (delta_a - delta_ex) / delta_ex;
    fprintf('\n     n: %d =>  Approximate: %.4e, Exact: %.4e, Percent: %f%%', n, delta_a, delta_ex, percent);
end