%%%%%%%%% P1-C4 %%%%%%%%%%
clc; clear;

P = input("Force Applied [=> kips]: ");
ultimate_load = input("Ultimate Load [=> kips]: ");

c = 0;
alpha_range = cell(11, 1);
beta_range = cell(11, 1);

for i = atand(0:0.1:1)
    c = c + 1;
    val = i.* (pi/180);
    beta_range{c, 1} = val; alpha_range{c, 1} = val;
end

alpha_length = length(alpha_range);
beta_length = length(beta_range);

f_s = zeros(alpha_length, beta_length);

for i = 1:alpha_length
    for j = 1:beta_length
        alpha = alpha_range{i, 1};
        beta = beta_range{j, 1};

        force = P * ((15*sin(alpha) + 30 * cos(alpha)) / (15 * cos(beta) + 12 * sin(beta)));

        f_s(i, j) = ultimate_load / force;
    end
end

disp(f_s);