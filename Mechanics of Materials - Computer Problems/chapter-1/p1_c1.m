%%%%%%%%%% P1-C1 %%%%%%%%%%
clc; clear;

customary_unit = input("Choose unit system ['SI' || 'US']: ");
tElements = input("Total Elements : ");

if ~ (customary_unit == "US") && ~ (customary_unit == "SI"); disp("Please enter the correct customary units!"); return; end;
if ~ isnumeric(tElements) || ~ isscalar(tElements) || ~(tElements > 0); disp("Please enter a number!"); return; end;
if customary_unit == "SI"
    unit_si = true;
    unitData = struct('diameter', 'm', 'load', 'N');
else
    unit_si = false;
    unitData = struct('diameter', 'in', 'load', 'kips');
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
    if unit_si == true
        fprintf('\n ------ Element %d ------\n   Force: %.2f (N)\n   Area: %.4e (m²)\n   Average Stress: %.4f (MPa)\n', c, data{c}.load, data{c}.area, pascalsToMegapascals(data{c}.averageStress));
    else
        fprintf('\n ------ Element %d ------\n   Force: %.2f (kips)\n   Area: %.4e (in²)\n   Average Stress: %.4f (ksi)\n', c, data{c}.load, data{c}.area, data{c}.averageStress);
    end
end

function megapascals = pascalsToMegapascals(pascals)
    megapascals = pascals / 1e6;
end