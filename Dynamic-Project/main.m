clc; clear;

data = cell(1, 1);

nodeCount = input('Enter the number of nodes: ');
data{1, 1}.nodes = zeros(nodeCount, 2);
for i = 1:nodeCount
    e_l = num2str(i);
    data{1, 1}.nodes(i, :) = input(['Enter coordinates for node (' e_l ') [x y]: ']);
end

elementCount = input('Enter the number of elements: ');
data{1, 1}.elements = zeros(elementCount, 5);
for i = 1:elementCount
    e_l = num2str(i);
    data{1, 1}.elements(i, :) = input(['Enter Data for Element (' e_l ') [node1 node2 A(m²) E(Pa) yieldStress(Pa)]: ']);
end

forceNodesCount = input('Enter the number of nodes with forces: ');
data{1, 1}.forces = zeros(forceNodesCount, 3);
for i = 1:forceNodesCount
    e_l = num2str(i);
    data{1, 1}.forces(i, :) = input(['Enter Data for forces (' e_l ') [nodeNumber F(N) nodeAngle]: ']);
end

supportCount = input('Enter the number of support: ');
data{1, 1}.supports = zeros(supportCount, 3);
for i = 1:supportCount
    e_l = num2str(i);
    data{1, 1}.supports(i, :) = input(['Enter Data for supports (' e_l ') [nodeNumber type(1,2) orien(0,1,2)]: ']);
end

data{1, 1}.element_lengths = zeros(elementCount, 1);
data{1, 1}.element_angles = zeros(elementCount, 1);

for i = 1:elementCount
    n_1 = data{1, 1}.elements(i, 1);
    n_2 = data{1, 1}.elements(i, 2);

    x_1 = data{1, 1}.nodes(n_1, 1);
    x_2 = data{1, 1}.nodes(n_2, 1);
    delta_x = x_2 - x_1;

    y_1 = data{1, 1}.nodes(n_1, 2);
    y_2 = data{1, 1}.nodes(n_2, 2);
    delta_y = y_2 - y_1;

    data{1, 1}.element_lengths(i) = sqrt((delta_x^2) +(delta_y^2));
    data{1, 1}.element_angles(i) = atan2(delta_y, delta_x);

    area = data{1, 1}.elements(i, 3);
    young_modulus = data{1, 1}.elements(i, 4);

    s_i_n = sin(data{1, 1}.element_angles(i));
    c_o_s = cos(data{1, 1}.element_angles(i));

    delta_f_mat = [c_o_s^2 s_i_n*c_o_s -c_o_s^2 -s_i_n*c_o_s;s_i_n*c_o_s s_i_n^2 -s_i_n*c_o_s -s_i_n^2;-c_o_s^2 -s_i_n*c_o_s c_o_s^2 s_i_n*c_o_s;-s_i_n*c_o_s -s_i_n^2 s_i_n*c_o_s s_i_n^2];
    k{i} = area * young_modulus / data{1, 1}.element_lengths(i) * delta_f_mat;
end

k_data = zeros(2 * nodeCount);
k0_data = k_data;

for i = 1:elementCount
    n_1 = data{1, 1}.elements(i, 1);
    n_2 = data{1, 1}.elements(i, 2);

    k0_data(2*n_1-1:2*n_1, 2*n_1-1:2*n_1) = k{i} (1:2, 1:2);
    k0_data(2*n_1-1:2*n_1, 2*n_2-1:2*n_2) = k{i} (1:2, 3:4);

    k0_data(2*n_2-1:2*n_2, 2*n_1-1:2*n_1) = k{i} (3:4, 1:2);
    k0_data(2*n_2-1:2*n_2, 2*n_2-1:2*n_2) = k{i} (3:4, 3:4);


    k_data = k_data + k0_data;
    k0_data(:, :) = 0;
end

force_0 = zeros(2*nodeCount, 1);
for i = 1:forceNodesCount
    force_node = data{1, 1}.forces(i, 1);
    force_len = data{1, 1}.forces(i, 2);
    force_angle = data{1, 1}.forces(i, 3) / 180 * pi;

    fx = force_len * cos(force_angle);
    fy = force_len * sin(force_angle);

    force_0(2*force_node-1:2*force_node, 1) = [fx; fy];
end

cnt = 0;
for i = 1:supportCount
    support_node = data{1, 1}.supports(i, 1);
    support_type = data{1, 1}.supports(i, 2);
    support_orien = data{1, 1}.supports(i, 3);

    if support_type == 1
        if support_orien == 1
            cnt = cnt + 1;
            uu_zero(cnt) = 2*support_node-1;
        elseif support_orien == 2
            cnt = cnt + 1;
            uu_zero(cnt) = 2*support_node;
        end
    elseif support_type == 2
        cnt = cnt + 2;
        uu_zero(cnt-1:cnt) = 2*support_node-1:2*support_node;
    end
end

kc_data = k_data;
fc_data = force_0;

kc_data(:, uu_zero) = [];
kc_data(uu_zero, :) = [];

fc_data(uu_zero, :) = [];

uo_data = kc_data^-1*fc_data;

uu_all = 1:2*nodeCount;
uu_nonzero = uu_all;
uu_nonzero(uu_zero) = [];

u_data(uu_all, 1) = 0;
u_data(uu_nonzero, 1) = uo_data;

force = k_data*u_data;

for i = 1:elementCount
    s_i_n = sin(data{1, 1}.element_angles(i));
    c_o_s = cos(data{1, 1}.element_angles(i));

    n_1 = data{1, 1}.elements(i, 1);
    n_2 = data{1, 1}.elements(i, 2);

    delta = [-c_o_s -s_i_n c_o_s s_i_n] * [u_data(2*n_1-1); u_data(2*n_1); u_data(2*n_2-1); u_data(2*n_2)];

    area = data{1, 1}.elements(i, 3);
    young_modulus = data{1, 1}.elements(i, 4);

    p = area * young_modulus / data{1, 1}.element_lengths(i) * delta;

    element_res(i, 1) = delta;
    element_res(i, 2) = p;
    element_res(i, 3) = p/area;
end

for i = 1:elementCount
    node_first = data{1, 1}.elements(i, 1);
    node_second = data{1, 1}.elements(i, 2);
    yield_stress = data{1, 1}.elements(i, 5);

    delta_len = meterTomicroMetres(element_res(i, 1));
    force = element_res(i, 2);
    stress = pascalsToMegapascals(element_res(i, 3));
    strain = element_res(i, 1) / data{1, 1}.element_lengths(i);
    stress_utilisation = abs(element_res(i, 3) / yield_stress) * 100;

    fprintf('\n -------------------- Element (%g) [n: %g,%g] --------------------\n   Delta L: %g (um) \n   Force: %g (N) \n   Stress: %g (MPa) \n   Strain: %g \n   Stress Utilisation: %g%%', i, node_first, node_second, delta_len, force, stress, strain, stress_utilisation);
end
fprintf('\n');

function microMetres = meterTomicroMetres(meter)
    microMetres = meter * 1e6;
end

function megapascals = pascalsToMegapascals(pascals)
    megapascals = pascals / 1e6;
end