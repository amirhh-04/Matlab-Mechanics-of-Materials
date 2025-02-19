import math

tel = int(input("Total Elements= "))

for c in range(1, tel + 1):
    diameter = float(input(f'diameter E:{c} (m)= '))
    load = float(input(f'load applied E:{c} (N)= '))

    area = math.pi * (diameter / 2)**2
    average_stress = load / area

    print(f'\n El {c} : Force= {load:.2f} N,   Area= {area:.4e} m²,   Average Stress= {average_stress / 1e6:.4f} MPa')