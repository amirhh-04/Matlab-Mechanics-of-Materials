%%%%%%%%%% P1-C1 %%%%%%%%%%
clc; clear;

customary_unit = input("Choose unit system ['SI' || 'US']: ");
tElements = input("Total Elements : ");

if ~ (customary_unit == "US") && ~ (customary_unit == "SI"); disp("Please enter the correct customary units!"); return; end;
if ~ isnumeric(tElements) || ~ isscalar(tElements) || ~(tElements > 0); disp("Please enter a number!"); return; end;
if customary_unit == "SI"
    unitData = struct('si', true, 'diameter', 'm', 'load', 'N', 'area', 'm²', 'stress', 'MPa');
else
    unitData = struct('si', false, 'diameter', 'in', 'load', 'kips', 'area', 'in²', 'stress', 'ksi');
end

data = cell(tElements, 1);

for c = 1:tElements
    e_l = num2str(c);
    diameter = input(['Diameter (E:'  e_l  ') [=> ' unitData.diameter ']: ']);
    load = input(['Load Applied (E:'  e_l  ') [=> ' unitData.load ']: ']);

    data{c, 1} = struct('diameter', diameter, 'load', load);

    area = pi * (data{c}.diameter / 2)^2;
    averageStress = data{c}.load / area;

    data{c, 1}.area = area;
    data{c, 1}.averageStress = averageStress;
end

for c = 1:tElements
    unit_si = unitData.si;
    averageStress = (unit_si * pascalsToMegapascals(data{c}.averageStress) + (1 - unit_si) * data{c}.averageStress);
    fprintf('\n ------ Element %d ------\n   Force: %.2f (%s)\n   Area: %.4e (%s)\n   Average Stress: %.4f (%s)\n', c, data{c}.load, unitData.load, data{c}.area, unitData.area, averageStress, unitData.stress);
end

function megapascals = pascalsToMegapascals(pascals)
    megapascals = pascals / 1e6;
end