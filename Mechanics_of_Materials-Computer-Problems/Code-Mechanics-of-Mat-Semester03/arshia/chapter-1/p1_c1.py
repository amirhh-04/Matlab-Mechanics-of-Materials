import math

def main():
    total_elements = int(input("Total Elements= "))

    for element_number in range(1, total_elements + 1):
        diameter = float(input(f'Enter diameter for Element {element_number} (m)= '))
        load = float(input(f'Enter applied load for Element {element_number} (N)= '))

        area = math.pi * (diameter / 2) ** 2
        average_stress = load / area

        print(f'\nElement {element_number} : Force= {load:.2f} N, Area= {area:.4e} m², Average Stress= {average_stress / 1e6:.4f} MPa')

if __name__ == "__main__":
    main()