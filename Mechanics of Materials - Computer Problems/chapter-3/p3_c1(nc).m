%%%%%%%%% P3-C1 %%%%%%%%%%
clc; clear;

customary_unit = input("Choose unit system ['SI' || 'US']: ");
tElements = input("Total Elements : ");

if ~ (customary_unit == "US") && ~ (customary_unit == "SI"); disp("Please enter the correct customary units!"); return; end;
if ~ isnumeric(tElements) || ~ isscalar(tElements) || ~(tElements > 0); disp("Please enter a number!"); return; end;
if customary_unit == "SI"
    unitData = struct('si', true, 'length', 'm', 'diameter', 'm', 't_applied', 'Pa', 'm_g', 'N', 'stress', 'Pa', 'delta', 'mm');
else
    unitData = struct('si', false, 'length', 'in', 'diameter', 'in', 't_applied', 'psi', 'm_g', 'lb', 'stress', 'ksi', 'delta', 'in');
end

data = cell(tElements, 1);
delta_point = 0;
totalTorque = 0;
angle_of_twist = 0;

for c = 1:tElements
    e_l = num2str(c);

    length = input(['Length Of Element (E:' e_l ') [=> ' unitData.length ']: ']);
    od = input(['Outer Diameter (E:' e_l ') [=> ' unitData.diameter ']: ']);
    id = input(['Inner Diameter (E:' e_l ') [=> ' unitData.diameter ']: ']);
    m_g = input(['Modulus of Rigidity (E:' e_l ') [=> ' unitData.m_g ']: ']);
    t_applied = input(['Torque Applied to Its Right-end (E:' e_l ') [=> ' unitData.t_applied ']: ']);

    j_data = (pi/32) * (od^4 - id^4);
    totalTorque = totalTorque + t_applied;
    ta_data = totalTorque * (od / 2) / j_data;
    phi_data = (totalTorque * length) / (m_g * j_data);
    angle_of_twist = angle_of_twist + phi_data;

    data{c, 1} = struct('length', length, 'm_g', m_g, 'j_data', j_data, 'totalTorque', totalTorque, 'ta_data', ta_data, 'phi_data', phi_data, 'angle_of_twist', angle_of_twist);
end