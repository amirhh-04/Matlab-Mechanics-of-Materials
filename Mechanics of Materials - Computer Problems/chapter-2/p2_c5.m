%%%%%%%%% P2-C5 %%%%%%%%%%
clc; clear;

hole_radius = input("Radius Of The Hole (Exa: [.125, .25]) [=> in]: ");
bar_width = input("Width Of The Bar [=> in]: ");
bar_thickness = input("Thickness Of The Bar [=> in]: ");
allowable_stress = input("Allowable Stress (avg) [=> ksi]: ");

for c = 1:length(hole_radius)
    hole_r = hole_radius(c);

    RD = 2.0*(hole_r / bar_width);
    K = 3.00 - 3.13*(RD) + 3.66*((RD)^2) - 1.53*((RD)^3);
    sigma_avg = allowable_stress / K;
    p_all = sigma_avg * (bar_width - 2.0*(hole_r))*bar_thickness;

    fprintf('\n ------------------------\n   Hole Radius : %.4f (in)\n   Allowable Load: %.4f (kips)', hole_r, p_all);
end