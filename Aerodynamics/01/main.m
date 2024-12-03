clc; clear; close all;

figure('Name', 'Combined 3D Fluid Element Motions: Translation, Rotation, Deformation, and Shear');
hold on;
axis equal;
xlim([-11 11]);
ylim([-11 11]);
zlim([-11 11]);
view(3);

% مختصات اولیه یک المان سیال (مکعب)
vertices = [-1 -1 -1; 1 -1 -1; 1 1 -1; -1 1 -1; -1 -1 1; 1 -1 1; 1 1 1; -1 1 1];
faces = [1 2 3 4; 5 6 7 8; 1 2 6 5; 2 3 7 6; 3 4 8 7; 4 1 5 8];

% تعداد فریم‌ها در هر حرکت
num_frames = 50;
pause_time = 0.05;

% 1. انتقال در هر سه محور (Translation in x, y, z)
for t = 1:num_frames
    clf;
    % انتقال مکعب در هر سه محور
    translation_vertices = vertices + [t*0.05, t*0.03, t*0.04];
    patch('Vertices', translation_vertices, 'Faces', faces, 'FaceColor', 'b', 'FaceAlpha', 0.3, 'EdgeColor', 'k');
    title('3D Translation in x, y, z');
    axis equal;
    grid on;
    xlim([-11 11]);
    ylim([-11 11]);
    zlim([-11 11]);
    view(3);
    pause(pause_time);
end

% 2. چرخش حول هر سه محور (Rotation around x, y, z)
theta = linspace(0, pi/4, num_frames);
for t = 1:num_frames
    clf;
    % ماتریس چرخش برای هر سه محور
    Rx = [1, 0, 0;
          0, cos(theta(t)), -sin(theta(t));
          0, sin(theta(t)),  cos(theta(t))];
    Ry = [cos(theta(t)), 0, sin(theta(t));
          0, 1, 0;
          -sin(theta(t)), 0, cos(theta(t))];
    Rz = [cos(theta(t)), -sin(theta(t)), 0;
          sin(theta(t)), cos(theta(t)), 0;
          0, 0, 1];
    rot_vertices = (Rz * Ry * Rx * translation_vertices')';
    patch('Vertices', rot_vertices, 'Faces', faces, 'FaceColor', 'r', 'FaceAlpha', 0.3, 'EdgeColor', 'k');
    title('3D Rotation around x, y, z');
    axis equal;
    grid on;
    xlim([-11 11]);
    ylim([-11 11]);
    zlim([-11 11]);
    view(3);
    pause(pause_time);
end

% 3. تغییر شکل در هر سه جهت (Deformation in x, y, z)
for t = 1:num_frames
    clf;
    % تغییر اندازه در هر سه محور
    deform_vertices = rot_vertices .* [1 + 0.02 * t, 1 - 0.01 * t, 1 + 0.015 * t];
    patch('Vertices', deform_vertices, 'Faces', faces, 'FaceColor', 'g', 'FaceAlpha', 0.3, 'EdgeColor', 'k');
    title('3D Deformation in x, y, z');
    axis equal;
    grid on;
    xlim([-11 11]);
    ylim([-11 11]);
    zlim([-11 11]);
    view(3);
    pause(pause_time);
end

% 4. تغییر شکل زاویه‌ای (Angular Deformation) - اعمال برش در هر سه محور
for t = 1:num_frames
    clf;
    % اعمال برش به سمت محور y و z
    shear_factor = 0.03 * t;
    shear_vertices = deform_vertices;
    shear_vertices(:,1) = shear_vertices(:,1) + shear_factor * shear_vertices(:,3); % برش در محور z
    shear_vertices(:,2) = shear_vertices(:,2) + shear_factor * shear_vertices(:,3); % برش در محور z
    patch('Vertices', shear_vertices, 'Faces', faces, 'FaceColor', 'c', 'FaceAlpha', 0.3, 'EdgeColor', 'k');
    title('3D Angular Deformation');
    axis equal;
    grid on;
    xlim([-11 11]);
    ylim([-11 11]);
    zlim([-11 11]);
    view(3);
    pause(pause_time);
end

grid on;
hold off;