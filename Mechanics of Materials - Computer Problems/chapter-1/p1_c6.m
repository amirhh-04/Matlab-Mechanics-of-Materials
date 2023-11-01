%%%%%%%%%% P1-C6 %%%%%%%%%%
clc; clear;

f_o_s = input("Factor Of Safety (F.S.): ");
u_s_s = input("Ultimate Shearing Stress [=> MPa]: ");
u_n_s = input("Ultimate Normal Stress [=> MPa]: ");
width_bd = input("Enter the width BD: [=> m]: ");
height_bd = input("Enter the height BD: [=> m]: ");

baseData = struct('label_1', 'AB', 'label_2', 'BC', 'pin_1', 'A', 'pin_2', 'B');
data = cell(3, 1);

for c = 1:3
    if c < 3
        label_name = ['label_' num2str(c)];
        distance = input(['Enter the distance ' baseData.(label_name) ' [=> m]: ']);
    
        pin_name = ['pin_' num2str(c)];
        diameter = input(['Enter the pin diameter ' baseData.(pin_name) ' [=> m]: ']);
    
        dis_name = ['distance_' baseData.(label_name)];
        pin_name = ['pinDiameter_' baseData.(pin_name)];
    
        baseData.(dis_name) = distance;
        baseData.(pin_name) = diameter;
    
        data{c, 1} = struct('diameter', diameter);
    
        if c == 2
            data{1, 1}.p = (baseData.distance_AB / baseData.distance_BC);
            data{2, 1}.p = (baseData.distance_AB / (baseData.distance_AB + baseData.distance_BC));
        end
    else
        data{3, 1}.p = (baseData.distance_AB / (baseData.distance_AB + baseData.distance_BC));
    end
end

for c = 1:3
    if c < 3
        area = (pi / 4) * (data{c, 1}.diameter)^2;
        f = ((2) * (u_s_s) * (area)) / (f_o_s);
    else
        area = width_bd * height_bd;
        f = ((2) * (u_n_s) * (area)) / (f_o_s);
    end

    p =  data{c, 1}.p * f;

    data{c, 1}.area = area;
    data{c, 1}.f = f;
    data{c, 1}.p = p;

    fprintf('\n ------------------------\n   A: %.4e (m²)\n   F: %.4e (N)\n   P: %.3e (N)', area, f, p);

    if c == 3
        [val, min_idx] = min([data{1, 1}.p, data{2, 1}.p, data{3, 1}.p]);
        if min_idx == 3
            mess = "Stress Is Critical In Links";
        elseif min_idx == 1
            mess = "Stress Is Critical In Pin A";
        else
            mess = "Stress Is Critical In Pins B and D";
        end

        fprintf('\n ------------------------\n   P = %.4e , %s.\n', val, mess);
    end
end 