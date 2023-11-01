%%%%%%%%% P2-C6 %%%%%%%%%%
clc; clear;

n_nums = input("Enter n [=> 1,4, ...]: ");

P = 6000;
L = .4;
c = .020;
E = 70e9;

data = cell(length(n_nums), 1);
delta = 0;
delta_exact = (P * L) / (2.0*pi*(c^2)*E);

for c = 1:length(n_nums)
    n = n_nums(c);
    for i = 1:n
        len = (i + 0.5)*(L / n);
        r = (2*c) - c*(len - L);
        area = pi * r^2;

        delta = delta + P * (L / n) / (area / E);
    end

    percent = 100*(delta - delta_exact) / delta_exact;

    data{c, 1} = struct('delta', delta, 'percent', percent, 'delta_exact', delta_exact);
end