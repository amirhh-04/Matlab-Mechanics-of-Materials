%%%%%%%%% P2-C3 %%%%%%%%%%
clc; clear;

customary_unit = input("Choose unit system ['SI' || 'US']: ");
tElements = input("Total Elements : ");
delta_b_t = input("Delta T : ");
constrained_ex = input("Constrained expansion : ");

if ~ (customary_unit == "US") && ~ (customary_unit == "SI"); disp("Please enter the correct customary units!"); return; end;
if ~ isnumeric(tElements) || ~ isscalar(tElements) || ~(tElements > 0); disp("Please enter a number!"); return; end;
if customary_unit == "SI"
    unitData = struct('si', true, 'c_t_e', 'F', 'length', 'm', 'diameter', 'm', 'elas_ticity', 'Pa', 'load_applied', 'N', 'stress', 'Pa', 'delta', 'mm');
else
    unitData = struct('si', false, 'c_t_e', 'F', 'length', 'in', 'diameter', 'in', 'elas_ticity', 'psi', 'load_applied', 'lb', 'stress', 'ksi', 'delta', 'in');
end

data = cell(tElements, 1);
delta_t = 0;
p_delta = 0;

for c = 1:tElements
    e_l = num2str(c);
    length = input(['Length Of Element (E:' e_l ') [=> ' unitData.length ']: ']);
    c_t_e = input(['Coefficient Of Thermal Expansion-α (E:' e_l ') [=> ' unitData.c_t_e ']: ']);
    cs_area = input(['CS Area (E:' e_l ') [=> ' unitData.diameter ']: ']);
    elas_ticity = input(['Modulus Of Elasticity (E:' e_l ') [=> ' unitData.elas_ticity ']: ']);

    delta_t = delta_t + (length * c_t_e) * delta_b_t;
    p_delta = p_delta + (length / (elas_ticity * cs_area));

    if c == tElements
        delta_p = delta_t - constrained_ex;
        p = delta_p / p_delta;

        delta_b = (length * c_t_e * delta_b_t) - ((p * length) / (elas_ticity * cs_area));
    end

    %data{c, 1} = struct('stress', stress, 'length', length, 'diameter', diameter, 'elas_ticity', elas_ticity, 'load_applied', load_applied, 'delta', delta, 'delta_point', delta_point);
end
