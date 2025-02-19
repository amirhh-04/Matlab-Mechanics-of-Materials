import math

P = float(input("force applied (kips)= "))
ultimate_load = float(input("ultimate load (kips)= "))

c = 0
alpha_range = [math.radians(i) for i in range(0, 11)]
beta_range = [math.radians(i) for i in range(0, 11)]

alpha_length = len(alpha_range)
beta_length = len(beta_range)

f_s = [[0] * beta_length for _ in range(alpha_length)]

for i in range(alpha_length):
    for j in range(beta_length):
        alpha = alpha_range[i]
        beta = beta_range[j]

        force = P * ((15 * math.sin(alpha) + 30 * math.cos(alpha)) / (15 * math.cos(beta) + 12 * math.sin(beta)))

        f_s[i][j] = round(ultimate_load / force, 3)

for row in f_s:
    print(row)