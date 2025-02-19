import math

hole_r = float(input("radius of the hole (.125 or .25) (in)= "))
bar_width = float(input("width of the bar (in)= "))
bar_thickness = float(input("thickness of the bar (in)= "))
allowable_stress = float(input("allowable stress (avg) (ksi)= "))

RD = 2.0 * (hole_r / bar_width)
K = 3.00 - 3.13 * RD + 3.66 * RD**2 - 1.53 * RD**3
sigma_avg = allowable_stress / K
p_all = sigma_avg * (bar_width - 2.0 * hole_r) * bar_thickness
print(f'\n  Hole Radius= {hole_r:.4f} (in), Allowable Load= {p_all:.4f} (kips)')