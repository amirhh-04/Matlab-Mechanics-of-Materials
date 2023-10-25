%%%%%%%%%% P1-C1 %%%%%%%%%%
clc; clear;

tElements = input("Total Elements : ");
if ~ isnumeric(tElements) || ~ isscalar(tElements) || ~(tElements > 0); disp("Please enter a number!"); return; end;

data = cell(tElements, 1);

for c = 1:tElements
    diameter = input("Diameter (E:" + c + ") [=> m]: ");
    load = input("Load Applied (E:" + c + ") [=> N]: ");

    data{c, 1} = struct('diameter', diameter, 'load', load);

    area = pi * (data{c}.diameter / 2)^2;
    averageStress = data{c}.load / area;

    data{c, 1}.area = area;
    data{c, 1}.averageStress = averageStress;
end

for c = 1:tElements
    fprintf('\nElement %d \n    Force: %.2f (N)\n    Area: %.4e (M²)\n    Average Stress: %.4f (Pa)\n', c, data{c}.load, data{c}.area, data{c}.averageStress);
end