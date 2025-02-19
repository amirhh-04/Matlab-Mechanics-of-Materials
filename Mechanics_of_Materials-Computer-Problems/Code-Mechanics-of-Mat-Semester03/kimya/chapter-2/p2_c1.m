clc; clear; close all;

tel = input("number of elements: ");
del_p = 0;

for i = 1:tel
    len = input(['length of element E:' num2str(i) ' (m): ']);
    dia = input(['diameter E:' num2str(i) ' (m): ']);
    m_el = input(['modulus of elasticity E:' num2str(i) ' (Pa): ']);
    l_a = input(['load-applied to its right/top E:' num2str(i) ' (N): ']);

    cs_area = (pi / 4) * (dia)^2;

    delta = (l_a * len) / (cs_area * m_el);
    del_p = del_p + delta;
    stress = l_a / cs_area;

    fprintf('\n     Element Number: %d ==> Stress: %f Pa, Delta: %f mm, Delta Point: %f mm \n', i, stress / 1e6, delta * 1e3, del_p * 1e3);
end