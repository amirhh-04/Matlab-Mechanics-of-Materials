clc; clear; close all;

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

k_small_data = k_data;
forces_data = force_0;

k_small_data(:, uu_zero) = [];
k_small_data(uu_zero, :) = [];

forces_data(uu_zero, :) = [];

u_all_data = (k_small_data^-1) * forces_data;

uu_all = 1:2*nodeCount;
uu_nonzero = uu_all;
uu_nonzero(uu_zero) = [];

u_data(uu_all, 1) = 0;
u_data(uu_nonzero, 1) = u_all_data;

force = k_data*u_data;
element_res = cell(elementCount, 1);
data{1, 1}.newNodesLoc = data{1, 1}.nodes;

for i = 1:elementCount
    s_i_n = sin(data{1, 1}.element_angles(i));
    c_o_s = cos(data{1, 1}.element_angles(i));

    n_1 = data{1, 1}.elements(i, 1);
    n_2 = data{1, 1}.elements(i, 2);

    delta = [-c_o_s -s_i_n c_o_s s_i_n] * [u_data(2*n_1-1); u_data(2*n_1); u_data(2*n_2-1); u_data(2*n_2)];

    n1_new_loc_x = u_data(2*n_1-1) * -c_o_s;
    n1_new_loc_y = u_data(2*n_1) * -s_i_n;

    n2_new_loc_x = u_data(2*n_2-1) * c_o_s;
    n2_new_loc_y = u_data(2*n_2) * s_i_n;

    data{1, 1}.newNodesLoc(n_1, :) = data{1, 1}.newNodesLoc(n_1, :) + [n1_new_loc_x, n1_new_loc_y];
    data{1, 1}.newNodesLoc(n_2, :) = data{1, 1}.newNodesLoc(n_2, :) + [n2_new_loc_x, n2_new_loc_y];

    area = data{1, 1}.elements(i, 3);
    young_modulus = data{1, 1}.elements(i, 4);

    p = area * young_modulus / data{1, 1}.element_lengths(i) * delta;

    element_res{i, 1}.delta_len = delta;
    element_res{i, 1}.force = p;
    element_res{i, 1}.stress = p/area;
end

for i = 1:elementCount
    el_data = element_res{i, 1};

    node_first = data{1, 1}.elements(i, 1);
    node_second = data{1, 1}.elements(i, 2);
    yield_stress = data{1, 1}.elements(i, 5);
    el_len = data{1, 1}.element_lengths(i);

    delta_len = meterTomicroMetres(el_data.delta_len);
    force = el_data.force;
    stress = pascalsToMegapascals(el_data.stress);
    strain = (el_len + el_data.delta_len) / el_len;
    stress_utilisation = abs(el_data.stress / yield_stress) * 100;
    element_res{i, 1}.stress_utilisation = stress_utilisation;
    element_res{i, 1}.strain = strain;

    fprintf('\n -------------------- Element (%g) [n: %g,%g] --------------------\n   Delta L: %g (um) \n   Force: %g (N) \n   Stress: %g (MPa) \n   Strain: %g \n   Stress Utilisation: %g%%', i, node_first, node_second, delta_len, force, stress, strain, stress_utilisation);
end
fprintf('\n');

nodes = data{1, 1}.nodes;
new_nodes = data{1, 1}.newNodesLoc;
elements = data{1, 1}.elements;
supports = data{1, 1}.supports;

figure;
scatter(nodes(:, 1), nodes(:, 2), 120, [0.8500 0.3250 0.0980], 'filled');
hold on;

for i = 1:elementCount
    stress_utilisation = element_res{i, 1}.stress_utilisation;

    node1 = elements(i, 1);
    node2 = elements(i, 2);
    
    x1 = nodes(node1, 1);
    y1 = nodes(node1, 2);
    
    x2 = nodes(node2, 1);
    y2 = nodes(node2, 2);
        
    new_x1 = new_nodes(node1, 1);
    new_y1 = new_nodes(node1, 2);
    
    new_x2 = new_nodes(node2, 1);
    new_y2 = new_nodes(node2, 2);

    broken = false;
    if stress_utilisation > 100
        color = [0.6350 0.0780 0.1840];
        broken = true;
    else
        color = [0 0.4470 0.7410];
    end
    
    line([new_x1, new_x2], [new_y1, new_y2], 'Color', "magenta", 'LineWidth', 2);
    line([x1, x2], [y1, y2], 'Color', color, 'LineWidth', 3);
end

for i = 1:supportCount
    node = supports(i, 1);
    support_type = supports(i, 2);
    support_orien = supports(i, 3);
    
    x = nodes(node, 1);
    y = nodes(node, 2);
    
    if support_type == 1
        color = 'b';
        h = 0.2;
        w = h * sqrt(2);
        x_points = [x-w/2, x, x+w/2];
        y_points = [y-h/2, y+h/2, y-h/2];
        patch(x_points, y_points, color, 'EdgeColor', 'none');
    elseif support_type == 2
        if support_orien == 1
            color = 'y';
        else 
            color = 'k';
        end
        h = 0.2;
        w = h * sqrt(2);
        x_points = [x-w/2, x, x+w/2];
        y_points = [y-h/2, y+h/2, y-h/2];
        patch(x_points, y_points, color, 'EdgeColor', 'none');
    end
end

title('STRUCTURE: ');
grid on;
axis equal;

function microMetres = meterTomicroMetres(meter)
    microMetres = meter * 1e6;
end

function megapascals = pascalsToMegapascals(pascals)
    megapascals = pascals / 1e6;
end