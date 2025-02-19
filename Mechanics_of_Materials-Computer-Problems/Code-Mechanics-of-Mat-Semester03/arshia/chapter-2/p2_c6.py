import math

n = int(input(" n (6, 12, 60)= "))  # 60
P = float(input(" P (N)= "))  # 1000
L = float(input(" L (m)= "))  # 10
c = float(input(" c (m)= "))  # 1
E = float(input(" E (GPa)= "))  # 200e9

delta_exact = (P * L) / (2 * math.pi * c**2 * E)

delta_approx = 0
for j in range(1, n + 1):
    len_ = (j - 0.5) * (L / n)
    r = 2 * c - c * (len_ / L)
    a = math.pi * r**2
    delta_approx = delta_approx + (P * (L / n)) / (a * E)
percent = 100 * (delta_approx - delta_exact) / delta_exact
print(f'\n n: {n} :  Approximate= {delta_approx:.5e}, Exact= {delta_exact:.5e}, Percent= {percent:.5f}')