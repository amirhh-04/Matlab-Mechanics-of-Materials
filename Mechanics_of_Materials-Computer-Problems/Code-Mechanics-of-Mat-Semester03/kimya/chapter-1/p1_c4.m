clc; clear; close all;

P = input("force applied (kips): ");
load_ult = input("ultimate load (kips): ");

c = 0;
a_r = cell(11, 1);
b_r = cell(11, 1);

for i = atand(0:0.1:1)
    c = c + 1;
    val = i.* (pi/180);
    b_r{c, 1} = val; a_r{c, 1} = val;
end

alpha_length = length(a_r);
beta_length = length(b_r);

f_s = zeros(alpha_length, beta_length);

for i = 1:alpha_length
    for j = 1:beta_length
        alpha = a_r{i, 1};
        beta = b_r{j, 1};

        force = P * ((15*sin(alpha) + 30 * cos(alpha)) / (15 * cos(beta) + 12 * sin(beta)));

        f_s(i, j) = load_ult / force;
    end
end

disp(f_s);