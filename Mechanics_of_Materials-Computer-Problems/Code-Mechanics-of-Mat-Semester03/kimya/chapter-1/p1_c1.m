clc; clear; close all;

tel = input("number of elements: ");

for i = 1:tel
    dia = input(['diameter E:'  num2str(i)  ' (m): ']);
    load = input(['load applied E:'  num2str(i)  ' (N): ']);

    area = pi * (dia / 2)^2;
    averageStress = (load / area) / 1e6;

    fprintf('\n     Element Number: %d ==> Force: %.2f N,   Area: %.4e m²,   Average Stress: %.4f MPa\n', i, load, area, averageStress);
end