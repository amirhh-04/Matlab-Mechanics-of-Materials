clc; clear;





% ورودی‌ها
nodeCount = input('Enter the number of nodes: ');
elementCount = input('Enter the number of elements: ');

% اطلاعات گره‌ها
nodes = zeros(nodeCount, 2);
for i = 1:nodeCount
    nodes(i, :) = input(['Enter coordinates for node ', num2str(i), ' [x y]: ']);
end

% اتصالات بین گره‌ها
connections = input('Enter connections between nodes as a matrix (e.g., [1 2; 1 3; 3 2]): ');

% نیروها
forceNodesCount = input('Enter the number of nodes with forces: ');
forces = zeros(forceNodesCount, 2);
forceNodes = zeros(forceNodesCount, 1);

for i = 1:forceNodesCount
    forceNodes(i) = input(['Enter the index of the node with force ', num2str(i), ': ']);
    forces(i, :) = input(['Enter forces applied to node ', num2str(forceNodes(i)), ' [Fx Fy]: ']);
end

% تعیین گره‌های تکیه‌گاه
supportNodes = zeros(nodeCount, 1);
supportNodeIndices = input('Enter the indices of support nodes (0 for none): ');

for i = 1:length(supportNodeIndices)
    supportNodes(supportNodeIndices(i)) = 1;
end

% محاسبات و نتایج
disp('Calculations and Results:');
for i = 1:elementCount
    % محاسبه طول المان
    lengths(i) = norm(nodes(connections(i, 1), :) - nodes(connections(i, 2), :));

    % محاسبه مساحت هر المان
    areas(i) = input(['Enter the cross-sectional area of element ', num2str(i), ': ']);

    % محاسبه تنش
    force1 = forces(forceNodes == connections(i, 1), :);
    force2 = forces(forceNodes == connections(i, 2), :);
    force = force1 - force2;
    stress = norm(force) / areas(i);

    % محاسبه کرنش
    strain = lengths(i) / norm(nodes(connections(i, 1), :) - nodes(connections(i, 2), :));

    % نمایش نتایج
    fprintf('Element %d:\n', i);
    fprintf('Stress: %.2f Pa\n', stress);
    fprintf('Strain: %.6f\n', strain);
end
