%%%%%%%%% P2-C2 %%%%%%%%%%
clc; clear;

customary_unit = input("Choose unit system ['SI' || 'US']: ");
tElements = input("Total Elements : ");

if ~ (customary_unit == "US") && ~ (customary_unit == "SI"); disp("Please enter the correct customary units!"); return; end;
if ~ isnumeric(tElements) || ~ isscalar(tElements) || ~(tElements > 0); disp("Please enter a number!"); return; end;
if customary_unit == "SI"
    unitData = struct('si', true, 'length', 'm', 'elas_ticity', 'Pa', 'load_applied', 'N', 'area', 'm²', 'stress', 'MPa', 'deformation', 'mm', 'rb_a', 'kN');
else
    unitData = struct('si', false, 'length', 'in', 'in', 'elas_ticity', 'psi', 'load_applied', 'lb', 'area', 'in²', 'stress', 'ksi', 'deformation', 'in', 'rb_a', 'kips');
end

data = cell(tElements, 3);
axial_load = 0;
delta_b = 0;  % total deformation
unit_delta_b = 0;

for c = 1:tElements
    e_l = num2str(c);

    length = input(['Length of Element (E:' e_l ') [=> ' unitData.length ']: ']);
    area = input(['Area of Element (E:' e_l ') [=> ' unitData.area ']: ']);
    elas_ticity = input(['Modulus of Elasticity of Element (E:' e_l ') [=> ' unitData.elas_ticity ']: ']);
    load_applied = input(['Load-Applied (E:' e_l ') [=> ' unitData.load_applied ']: ']);

    axial_load = axial_load + load_applied;

    sigma_i = axial_load / area;
    delta_i = (axial_load * length) / (area * elas_ticity);

    delta_b = delta_b + delta_i;

    unit_sigma_i = 1 / area;
    unit_delta_i = length  / (area * elas_ticity);

    unit_delta_b = unit_delta_b + unit_delta_i;

    data{c, 1} = struct('element', c, 'length', length, 'area', area, 'elas_ticity', elas_ticity, 'load_applied', load_applied, 'axial_load', axial_load, 'sigma_i', sigma_i, 'delta_i', delta_i, 'delta_b', delta_b, 'unit_sigma_i', unit_sigma_i, 'unit_delta_i', unit_delta_i, 'unit_delta_b', unit_delta_b);
end

R_b = -(delta_b) / unit_delta_b;
R_a = axial_load + R_b;

unit_si = unitData.si;
ra = (unit_si * nToKilonewton(R_a) + (1 - unit_si) * poundToKips(R_a));
rb = (unit_si * nToKilonewton(R_b) + (1 - unit_si) * poundToKips(R_b));
fprintf('\n -------------------------------------------\n   R-B: %.4f (%s),   R-A: %.4f (%s) \n ------------------------------------------- \n', -ra, unitData.rb_a, rb, unitData.rb_a);

for c = 1:tElements
    e_l = num2str(c);

    e_sigma = data{c, 1}.sigma_i + R_b * data{c, 1}.unit_sigma_i;
    e_delta = data{c, 1}.delta_i + R_b * data{c, 1}.unit_delta_i;

    
    l_sigma = (unit_si * pascalsToMegapascals(e_sigma) + (1 - unit_si) * poundToKips(e_sigma));
    l_delta = (unit_si * meterTomm(e_delta) + (1 - unit_si) * e_delta);

    fprintf('  Element: %d ,   Stress: %.4f (%s) ,   Deformation: %.5f (%s)  \n', c, -l_sigma, unitData.stress, -l_delta, unitData.deformation);
end

function kips = poundToKips(pound)
    kips = pound / 1e3;
end

function kilonewton = nToKilonewton(n)
    kilonewton = n / 1e3;
end

function megapascals = pascalsToMegapascals(pascals)
    megapascals = pascals / 1e6;
end

function micrometer = meterTomm(meter)
    micrometer = meter * 1e3;
end