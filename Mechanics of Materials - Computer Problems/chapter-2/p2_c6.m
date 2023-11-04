%%%%%%%%% P2-C6 %%%%%%%%%%
clc; clear;

n_nums = input(" Enter n [=> 1,4, ...]: "); % n_nums = [6, 12, 60]
P = input(" Enter P [=> N]: "); % P = 1000;
L = input(" Enter L [=> m]: "); % L = 10;
c = input(" Enter c [=> m]: "); % c = 1;
E = input(" Enter E [=> GPa]: "); % E = 200e9;

delta_exact = (P * L) / (2 * pi * c^2 * E);
delta_approx = cell(length(n_nums), 1);
percent_errors = cell(length(n_nums), 1);

for i = 1:length(n_nums)
    n = n_nums(i);

    delta_approx{i, 1} = approximate_elongation(P, L, c, E, n);
    percent_errors{i, 1} = 100 * (delta_approx{i, 1} - delta_exact) / delta_exact;

    fprintf('\n ------------------------\n   n: %d \n   Approximate: %.4e \n   Exact: %.4e \n   Percentage Error: %f%%', n, delta_approx{i, 1}, delta_exact, percent_errors{i, 1});
end

function delta_approx = approximate_elongation(P, L, c, E, n)
    delta_approx = 0;
    
    for i = 1:n
        len = (i - 0.5) * (L / n);
        r = 2 * c - c * (len / L);
        a = pi * r^2;
        delta_approx = delta_approx + (P * (L / n)) / (a * E);
    end
end
