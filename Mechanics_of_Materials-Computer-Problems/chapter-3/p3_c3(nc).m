%%%%%%%%% P3-C3 %%%%%%%%%%
clc; clear;

tElements = input("Total Elements : ");

data = cell(tElements, 1);
totalTorque = 0;
angle_of_twist = 0;
unitData = struct('si', true, 'length', 'm', 'diameter', 'm', 't_applied', 'N.m', 'm_g', 'Pa', 'stress', 'Pa', 'delta', 'mm', 'deg', 'degrees', 'max_stress', 'MPa');

for c = 1:tElements
    e_l = num2str(c);

    length = input(['Length Of Element (E:' e_l ') [=> ' unitData.length ']: ']);
    od = input(['Outer Diameter (E:' e_l ') [=> ' unitData.diameter ']: ']);
    id = input(['Inner Diameter (E:' e_l ') [=> ' unitData.diameter ']: ']);
    m_g = input(['Modulus of Rigidity (E:' e_l ') [=> ' unitData.m_g ']: ']);
    t_applied = input(['Torque Applied to Its Right-end (E:' e_l ') [=> ' unitData.t_applied ']: ']);

    j_data = (pi/2) * (od^4 - id^4);
    totalTorque = totalTorque + t_applied;
    ta_data = totalTorque*(od/2) * j_data;
    phi_data = (totalTorque * length) / (m_g * j_data);
    angle_of_twist = angle_of_twist + phi_data;

    angle_of_twist_b = angle_of_twist;

    unit_ta_data = od / (2*j_data);
    unit_phi_data = (length) / (m_g * j_data);

    unit_angle_of_twist_b = angle_of_twist_b + unit_phi_data;

    data{c, 1} = struct('j_data', j_data, 'totalTorque', totalTorque, 'ta_data', ta_data, 'phi_data', phi_data, 'angle_of_twist', angle_of_twist, 'unit_angle_of_twist_b', unit_angle_of_twist_b);
end

fprintf('\n ----------------------------------------- \n')

for c = 1:tElements
    elementData = data{c, 1};
    fprintf('  Element: %d, Maximum Stress: %.4f (%s), Angle of Twist: %.5f (%s)  \n', c, pascalsToMegapascals(elementData.ta_data), unitData.max_stress,  rad2deg(elementData.phi_data), unitData.deg);
end

fprintf(' ----------------------------------------- \n  Angle of twist for entire shaft: %.5f (%s) \n ----------------------------------------- \n', rad2deg(angle_of_twist), unitData.deg);

function megapascals = pascalsToMegapascals(pascals)
    megapascals = pascals / 1e6;
end