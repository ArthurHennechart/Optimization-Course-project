%% 2.1
clc; clear; close all;
f = @(x) x.^4 + 4*x.^3 + 9*x.^2 + 6*x + 6;
x_opt = Golden_Section(f, -2, 2, 1e-2);
fprintf('Partie 2.1\n');
fprintf('Résultat Golden Section:\n');
fprintf('x optimal = %.4f\n\n', x_opt);

x_vals = linspace(-2,2,500);
y_vals = f(x_vals);
figure;
plot(x_vals, y_vals, 'b-', 'LineWidth', 2); 
hold on;
plot(x_opt, f(x_opt), 'ro', 'Markersize', 8, 'MarkerFaceColor', 'r');
xlabel('x');
ylabel('f(x)');
title('Golden Section Method - Verification')
legend('f(x)','Minimum trouvé','Location','best');
grid on;

%% 2.2
%%Newton
f = @(x) 2*x.^4 - 5*x.^3 + 100*x.^2 +30*x -75;
df = @(x) 8*x.^3 - 15*x.^2 + 200*x + 30;
d2f = @(x) 24*x.^2 - 30*x + 200;
x_newton = Newton_Method(df, d2f, 2, 1e-4);
x_secant = Secant_Method(df, 2.1, 2, 1e-4);

fprintf('Partie 2.2\n');
fprintf('Résultat Newton Method:\n');
fprintf('x optimal = %.4f\n\n', x_newton);
fprintf('Résultat Secant Method:\n');
fprintf('x optimal = %.4f\n\n', x_secant);

eps_newton = 1e-4;
eps_secant = 1e-4;

[x_newton, x_hist_newton] = Newton_Method_Hist(df, d2f, 2, eps_newton);
[x_secant, x_hist_secant] = Secant_Method_Hist(df, 2, 2.1, eps_secant);

x_vals = linspace(-5,5,500);
y_vals = f(x_vals);
figure; hold on; grid on;
plot(x_vals, y_vals, 'b-', 'LineWidth', 2); 
plot(x_hist_newton, f(x_hist_newton), 'ro-', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
plot(x_hist_secant, f(x_hist_secant), 'gs-', 'LineWidth', 1.5, 'MarkerFaceColor', 'g');
xlabel('x');
ylabel('f(x)');
title('Newton vs Secant Method - Convergence')
legend('f(x)','Newton iterations','Secant iterations','Location', 'best');