import math

tel = int(input("Total Elements= "))
delta_point = 0

for c in range(1, tel + 1):
    length = float(input(f'length of element E:{c} (m)= '))
    diameter = float(input(f'diameter E:{c} (m)= '))
    elasticity = float(input(f'modulus of elasticity E:{c} (Pa)= '))
    load_applied = float(input(f'load-applied to its right/top E:{c} (N)= '))

    cs_area = (math.pi / 4) * diameter**2

    delta = (load_applied * length) / (cs_area * elasticity)
    delta_point += delta
    stress = load_applied / cs_area

    print(f'\n El {c} => Stress= {stress / 1e6} Pa, Delta= {delta * 1e3} mm, Delta Point= {delta_point * 1e3} mm\n')