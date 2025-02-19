clc; clear; close all;

tel = input("number of elements: ");

tT = 0;
aot = 0;

for i = 1:tel
    len = input(['length of element E:' num2str(i) ' (m): ']);
    od = input(['outer diameter E:' num2str(i) ' (m): ']);
    id = input(['inner diameter E:' num2str(i) ' (m): ']);
    m_g = input(['modulus of rigidity E:' num2str(i) ' (Pa): ']);
    t_applied = input(['torque aplied to its right-end E:' num2str(i) ' (N.m): ']);

    j_d = (pi/2) * (od^4 - id^4);
    tT = tT + t_applied;
    ta = (tT * od) / j_d;
    phi = (tT * len) / (m_g * j_d);
    aot = aot + phi;

    fprintf('     Element: %d ==> Max Stress: %.4f MPa, Angle of Twist: %.5f degrees  \n', i, (ta) / 1e6,  rad2deg(phi));
end

fprintf('     A Shaft: %.5f degrees \n', rad2deg(aot));