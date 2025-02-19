import math

fos = float(input("factor of safety (F.S.)= "))
uss = float(input("ultimate shearing stress (MPa)= "))
uns = float(input("ultimate normal stress (MPa)= "))
width_bd = float(input("enter the width BD (m)= "))
height_bd = float(input("enter the height BD (m)= "))

base_data = {'label_1': 'AB', 'label_2': 'BC', 'pin_1': 'A', 'pin_2': 'B'}
data = [{} for _ in range(3)]

for c in range(3):
    if c < 2:
        label_name = f'label_{c+1}'
        distance = float(input(f'enter the distance {base_data[label_name]} (m)= '))
    
        pin_name = f'pin_{c+1}'
        diameter = float(input(f'enter the pin diameter {base_data[pin_name]} (m)= '))
    
        dis_name = f'distance_{base_data[label_name]}'
        pin_name = f'pinDiameter_{base_data[pin_name]}'
    
        base_data[dis_name] = distance
        base_data[pin_name] = diameter
    
        data[c] = {'diameter': diameter}
    
        if c == 1:
            data[0]['p'] = base_data['distance_AB'] / base_data['distance_BC']
            data[1]['p'] = base_data['distance_AB'] / (base_data['distance_AB'] + base_data['distance_BC'])
    else:
        data[2]['p'] = base_data['distance_AB'] / (base_data['distance_AB'] + base_data['distance_BC'])

for c in range(3):
    if c < 2:
        area = (math.pi / 4) * data[c]['diameter']**2
        f = (2 * uss * area) / fos
    else:
        area = width_bd * height_bd
        f = (2 * uns * area) / fos

    p = data[c]['p'] * f

    data[c]['area'] = area
    data[c]['f'] = f
    data[c]['p'] = p

    print(f'\n A = {area:.4e} m²,   F = {f:.4e} N,   P = {p:.3e} N')

    if c == 2:
        val, min_idx = min((data[0]['p'], 0), (data[1]['p'], 1), (data[2]['p'], 2), key=lambda x: x[0])
        if min_idx == 2:
            mess = "stress is critical in links"
        elif min_idx == 0:
            mess = "stress is critical in pin A"
        else:
            mess = "stress is critical in pins B and D"

        print(f'\n P = {val:.4e}, {mess}.\n')