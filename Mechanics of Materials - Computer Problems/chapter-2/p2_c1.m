%%%%%%%%% P2-C1 %%%%%%%%%%
clc; clear;

customary_unit = input("Choose unit system ['SI' || 'US']: ");
tElements = input("Total Elements : ");

if ~ (customary_unit == "US") && ~ (customary_unit == "SI"); disp("Please enter the correct customary units!"); return; end;
if ~ isnumeric(tElements) || ~ isscalar(tElements) || ~(tElements > 0); disp("Please enter a number!"); return; end;
if customary_unit == "SI"
    unit_si = true;
    unitData = struct('length', 'm', 'diameter', 'm', 'elas_ticity', 'Pa', 'load_applied', 'N', 'stress', 'Pa', 'delta', 'mm');
else
    unit_si = false;
    unitData = struct('length', 'in', 'diameter', 'in', 'elas_ticity', 'psi', 'load_applied', 'lb', 'stress', 'ksi', 'delta', 'in');
end

data = cell(tElements, 1);
delta_point = 0;

for c = 1:tElements
    e_l = num2str(c);
    length = input(['Length Of Element (E:' e_l ') [=> ' unitData.length ']: ']);
    diameter = input(['Diameter (E:' e_l ') [=> ' unitData.diameter ']: ']);
    elas_ticity = input(['Modulus Of Elasticity (E:' e_l ') [=> ' unitData.elas_ticity ']: ']);
    load_applied = input(['Load-Applied To Its Right/Top (E:' e_l ') [=> ' unitData.load_applied ']: ']);

    cs_area = (pi / 4) * (diameter)^2;

    delta = (load_applied * length) / (cs_area * elas_ticity);
    delta_point = delta_point + delta;
    stress = load_applied / cs_area;

    data{c, 1} = struct('stress', stress, 'length', length, 'diameter', diameter, 'elas_ticity', elas_ticity, 'load_applied', load_applied, 'delta', delta, 'delta_point', delta_point);
end

for c = 1:tElements
    stress = (unit_si * pascalsToMegapascals(data{c}.stress) + (1 - unit_si) * psiToKsi(data{c}.stress));
    delta = (unit_si * metersToMillimeters(data{c}.delta) + (1 - unit_si) * data{c}.delta);
    delta_point = (unit_si * metersToMillimeters(data{c}.delta_point) + (1 - unit_si) * data{c}.delta_point);

    fprintf('\n ------ Element %d ------ \n   Stress: %f (%s) \n   Delta: %f (%s) \n   Delta Point: %f (%s) \n', c, stress, unitData.stress, delta, unitData.delta, delta_point, unitData.delta);
end

function millimeters = metersToMillimeters(meters)
    millimeters = meters * 1e3;
end

function megapascals = pascalsToMegapascals(pascals)
    megapascals = pascals / 1e6;
end

function ksi = psiToKsi(psi)
    ksi = psi / 1e3;
end
