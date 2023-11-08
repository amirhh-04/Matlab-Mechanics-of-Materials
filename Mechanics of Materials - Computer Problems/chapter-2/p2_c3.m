%%%%%%%%% P2-C3 %%%%%%%%%%
clc; clear;

customary_unit = input("Choose unit system ['SI' || 'US']: ");
tElements = input("Total Elements : ");

if ~ (customary_unit == "US") && ~ (customary_unit == "SI"); disp("Please enter the correct customary units!"); return; end;
if ~ isnumeric(tElements) || ~ isscalar(tElements) || ~(tElements > 0); disp("Please enter a number!"); return; end;
if customary_unit == "SI"
    unitData = struct('si', true, 'delta_t', '/C', 'length', 'm', 'delta_0', 'm', 'elas_ticity', 'Pa', 'ra', 'kN', 'alpha', '/C', 'area', 'm²', 'stress', 'MPa', 'deformation', 'microm');
else
    unitData = struct('si', false, 'delta_t', '/F', 'length', 'in', 'delta_0', 'in', 'elas_ticity', 'psi', 'ra', 'kips', 'alpha', '/F', 'area', 'in²', 'stress', 'ksi', 'deformation', 'in');
end

delta_t = input(['Delta T (temperature change) [=> ' unitData.delta_t ']: ']);
delta_0 = input(['Constrained expansion (delta 0) [=> ' unitData.delta_0 ']: ']);

data = cell(tElements, 3);
delta_b = 0;
unit_delta_b = 0;

for c = 1:tElements
    e_l = num2str(c);

    length = input(['Length of Element (E:' e_l ') [=> ' unitData.length ']: ']);
    area = input(['Cross-sectional Area of Element (E:' e_l ') [=> ' unitData.area ']: ']);
    elas_ticity = input(['Modulus of Elasticity of Element (E:' e_l ') [=> ' unitData.elas_ticity ']: ']);
    alpha = input(['Coefficient of Thermal Expansion of Element (E:' e_l ') [=> ' unitData.alpha ']: ']);

    data{c, 1} = struct('element', c, 'length', length, 'area', area, 'elas_ticity', elas_ticity, 'alpha', alpha);

    data{c, 1}.delta_i = alpha * length * delta_t;
    delta_b = delta_b + data{c, 1}.delta_i;

    unit_delta_i = length / (area * elas_ticity);
    unit_delta_b = unit_delta_b + unit_delta_i;
end

R_b = (delta_b - delta_0) / unit_delta_b;
R_a = -R_b;

unit_si = unitData.si;
rb = (unit_si * nToKilonewton(R_b) + (1 - unit_si) * poundToKips(R_b));
fprintf('\n --------------------------------\n   R: %.4f (%s)', rb, unitData.ra)

for c = 1:tElements
    elementData = data{c, 1};
    elementData.sigma = -R_b / elementData.area;
    elementData.delta_i = (elementData.alpha * elementData.length * delta_t) - ((R_b * elementData.length) / (elementData.area * elementData.elas_ticity));

    sigma = (unit_si * pascalsToMegapascals(elementData.sigma) + (1 - unit_si) * poundToKips(elementData.sigma));
    delta_i = (unit_si * meterToMicrometer(elementData.delta_i) + (1 - unit_si) * elementData.delta_i);

    fprintf('\n --------------------------------\n   Element: %d \n   Stress: %.4f (%s) \n   Deformation: %.4f (%s)', c, sigma, unitData.stress, delta_i, unitData.deformation);
end
fprintf('\n --------------------------------\n');

function kips = poundToKips(pound)
    kips = pound / 1e3;
end

function kilonewton = nToKilonewton(n)
    kilonewton = n / 1e6;
end

function megapascals = pascalsToMegapascals(pascals)
    megapascals = pascals / 1e6;
end

function micrometer = meterToMicrometer(meter)
    micrometer = meter * 1e6;
end