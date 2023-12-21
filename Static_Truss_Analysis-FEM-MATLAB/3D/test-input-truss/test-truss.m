%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%   Inputs Section    %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [x y z]
data{1, 1}.nodes = [0 0 0
                    4000 0 0
                    0 4000 0
                    0 0 4000];
nodeCount = size(data{1, 1}.nodes, 1);

% [node1 node2 A(m²) E(Pa) yieldStress(Pa)]
data{1, 1}.elements = [1 2 .000100 2e10 20e6
                       1 3 .000100 2e10 20e6
                       1 4 .000100 2e10 20e6
                       2 4 .000100 2e10 20e6
                       2 3 .000100 2e10 20e6
                       3 4 .000100 2e10 20e6];
elementCount = size(data{1, 1}.elements, 1);

% [nodeNumber F(N)-x F(N)-y F(N)-z]
data{1, 1}.forces = [4 10000 10000 0
                     3 -1000 0 0];
forceNodesCount = size(data{1, 1}.forces, 1);

% [nodeNumber Dx Dy Dz] (D => 0[free],1[close])
data{1, 1}.supports = [1 1 1 1
                       2 1 1 1
                       3 0 1 1];
supportCount = size(data{1, 1}.supports, 1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%   Inputs Section    %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [x y z]
data{1, 1}.nodes = [0 0 -4
                    -3 0 0
                    0 0 4
                    0 5 0];
nodeCount = size(data{1, 1}.nodes, 1);

% [node1 node2 A(m²) E(Pa) yieldStress(Pa)]
data{1, 1}.elements = [1 4 0.0010 200e9 20e6
                       2 4 0.002 200e9 20e6
                       3 4 0.0020 200e9 20e6];
elementCount = size(data{1, 1}.elements, 1);

% [nodeNumber F(N)-x F(N)-y F(N)-z]
data{1, 1}.forces = [4 1200000 0 0];
forceNodesCount = size(data{1, 1}.forces, 1);

% [nodeNumber Dx Dy Dz] (D => 0[free],1[close])
data{1, 1}.supports = [1 1 1 1
                       2 1 1 1
                       3 1 1 1];
supportCount = size(data{1, 1}.supports, 1);

