import math

def get_user_input():
    hole_r = float(input("radius of the hole (.125 or .25) (in)= "))
    bar_width = float(input("width of the bar (in)= "))
    bar_thickness = float(input("thickness of the bar (in)= "))
    allowable_stress = float(input("allowable stress (avg) (ksi)= "))
    return hole_r, bar_width, bar_thickness, allowable_stress

def calculate_allowable_load(hole_r, bar_width, bar_thickness, allowable_stress):
    RD = 2.0 * (hole_r / bar_width)
    K = 3.00 - 3.13 * RD + 3.66 * RD**2 - 1.53 * RD**3
    sigma_avg = allowable_stress / K
    p_all = sigma_avg * (bar_width - 2.0 * hole_r) * bar_thickness
    return p_all

def display_result(hole_r, result):
    print(f'\n  Hole Radius= {hole_r:.4f} (in), Allowable Load= {result:.4f} (kips)')

def main():
    user_input = get_user_input()
    result = calculate_allowable_load(*user_input)
    display_result(user_input[0], result)

if __name__ == "__main__":
    main()
