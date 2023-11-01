%%%%%%%%% P2-C5 %%%%%%%%%%
clc; clear;

radius_hole = input("Radius Of The Hole (Exa: [.125, .25]) [=> in]: ");
width_bar = input("Width Of The Bar [=> in]: ");
thickness = input("Thickness Of The Bar [=> in]: ");
sigma_all = input("S(avg) [=> ksi]: ");

for c = 1:length(radius_hole)
    r_h = radius_hole(c);

    RD = 2.0*(r_h / width_bar);
    K = 3.00 - 3.13*(RD) + 3.66*((RD)^2) - 1.53*((RD)^3);
    sigma_avg = sigma_all / K;
    p_all = sigma_avg * (width_bar - 2.0*(r_h))*thickness;

    fprintf('\n ------------------------\n   Radius : %.4f (in)\n   Allowable Load: %.4f (kips)', r_h, p_all);
end