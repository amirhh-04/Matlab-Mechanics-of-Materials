%%%%%%%%% P1-C4 %%%%%%%%%%
clc; clear;

P = input("Force Applied [=> kips]: ");
ultimate_load = input("Ultimate Load [=> kips]: ");

alpha_range = (0:0.1:45);
beta_range = (0:0.1:45);

f_s = zeros(length(alpha_range), length(beta_range));

for i = 1:length(alpha_range)
    for j = 1:length(beta_range)
        alpha = alpha_range(i);
        beta = beta_range(j);

        force = P * ((15*sin(alpha) + 30 * cos(alpha)) / (15 * cos(beta) + 12 * sin(beta)));

        f_s(i, j) = ultimate_load / force;
    end
end

% (b) محاسبه ماکزیمم فاکتور ایمنی برای هر مقدار α
[max_safety_factors, max_beta_indices] = max(f_s);
optimal_beta_values = beta_range(max_beta_indices);
optimal_alpha_values = alpha_range;


% (c) محاسبه مینیمم فاکتور ایمنی
[min_safety_factor, min_safety_factor_idx] = min(f_s(:));
[min_alpha_idx, min_beta_idx] = ind2sub(size(f_s), min_safety_factor_idx);



% Display the results
fprintf('(b) Maximum Safety Factor: %.4f for β = %.2f and α = %.2f in radians\n', max_safety_factors, optimal_beta_values, optimal_alpha_values);
fprintf('(c) Minimum Safety Factor: %.4f for β = %.2f and α = %.2f in radians\n', min_safety_factor, beta_range(min_beta_idx), alpha_range(min_alpha_idx));