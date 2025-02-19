clc; clear; close all;

numerator = [1 1];
denominator = [1 3 0 11 13 9 0 0 17];

poles = roots(denominator);

disp('Poles of the system:');
disp(poles);

figure;
plot(real(poles), imag(poles), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
hold on;
plot([-5 5], [0 0], 'k--');
plot([0 0], [-5 5], 'k--');
grid on;

title('Pole Locations');
xlabel('Real Axis');
ylabel('Imaginary Axis');
xlim([-5 5]);
ylim([-5 5]);
axis equal;
legend('Poles');