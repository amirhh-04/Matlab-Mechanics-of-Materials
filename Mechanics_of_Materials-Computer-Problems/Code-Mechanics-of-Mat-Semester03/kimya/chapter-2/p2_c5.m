clc; clear; close all;

hr = input("radius of the hole [.125, .25] (in): ");
bar_width = input("width of the bar (in): ");
thickness = input("thickness of the bar (in): ");
all_stress = input("allowable stress (avg) (ksi): ");

for i = 1:length(hr)
    hole_r = hr(i);

    RD = 2.0 * (hole_r / bar_width);
    K = 3.00 - 3.13*(RD) + 3.66*((RD)^2) - 1.53*((RD)^3);
    s_avg = all_stress / K;
    p_all = s_avg * (bar_width - 2.0*(hole_r))*thickness;

    fprintf('\n     Hole Radius => %.4f in, Allowable Load: %.4f kips', hole_r, p_all);
end