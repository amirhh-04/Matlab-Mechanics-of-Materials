clc; clear;

length_wood_surface = 150e-3; % m
width_wood_surface = 25e-3; % m
ela = 5.4000E+9; % Pa
len_e = 2.1; % m
sigma_c = 7.7e06; % Pa
c = 0.9;
n_values = [3, 4, 5];

for i = 1:length(n_values)
    n = n_values(i);
    
    area = length_wood_surface * (width_wood_surface * n);

    if n <= 6
        d = width_wood_surface * n;
        len_e_d = len_e / d;
    else
        d = length_wood_surface;
        len_e_d = len_e / d;
    end
    
    sigma_EC = (0.822 * ela) / (len_e_d)^2;
    Cp = ((1 + (sigma_EC / sigma_c)) / (2 * c)) - sqrt(((1 + (sigma_EC / sigma_c)) / (2 * c))^2 - ((sigma_EC / sigma_c) / c));
    
    sigma_all = Cp * sigma_c;
    
    P_all = sigma_all * area * 1e-3; % kN
    
    fprintf("n = %d , L/d = %.3f , A = %.3f , Cp = %.3f, sigma_EC/sigma_C = %.3f, P(all) = %.1f kN\n", n, len_e_d, area, sigma_EC / sigma_c, Cp, P_all);
end