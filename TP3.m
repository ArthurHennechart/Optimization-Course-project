clc; clear; close all;
fprintf('Partie 3\n');

%% 3.1
fprintf('3.1:\n');
x0 = [-1,2];
eps1 = 1e-3; %convergence
eps2 = 1e-4; %line search
x_rosen = Steepest_Descent_Rosen(x0, eps1, eps2);

fprintf('Rosenbrock Steepest Descent:\n');
fprintf('x_min = [%.6f, %.6f]\n',x_rosen(1), x_rosen(2));
fprintf('f(x_xmin) = %.6f\n\n', 100*(x_rosen(2)-x_rosen(1)^2)^2 + (1-x_rosen(1))^2);

%% 3.2
fprintf('3.2:\n');
x0_example = [1/2; 5/4];
g_example = [16*x0_example(1)*(2*x0_example(1)^2 - x0_example(2)) + 6*x0_example(1); -2*(2*x0_example(1)^2 - x0_example(2)) - 1];
H_example = [16*(6*x0_example(1)^2 - x0_example(2)) + 6, -4*x0_example(1); -4*x0_example(1), 2];
alpha = (g_example'*g_example)/(g_example'*H_example*g_example);
x1_example = x0_example - alpha*g_example;

fprintf('Initial x0 = [%2.f,%2.f]\n', x0_example(1), x0_example(2));
fprintf('Gradient g0 = [%.4f,%.4f]\n', g_example(1), g_example(2));
fprintf('Step size alpha = %.6f\n', alpha);
fprintf('x after 1 iteration = [%.6f, %.6f]\n\n', x1_example(1), x1_example(2));

%% 3.3
fprintf('3.3:\n');
Q1 = 5*eye(2);
q1 = [-3;-1];
x0_q1 = [-2;-8];
fprintf('Quadratic case 1: Q=5*I\n')
Steepest_Descent_Quad(Q1, q1, x0_q1)

Q2 = [10 0; 0 1];
q2 = [-3;-3];
x0_q2 = [-2;-7];
fprintf('Quadratic case 2: Q=[10 0;0 1]\n')
Steepest_Descent_Quad(Q2, q2, x0_q2)

Q3 = [2 0; 0 1];
q3 = [-3;-3];
x0_q3 = [-2;-7];
fprintf('Quadratic case 3: Q=[2 0;0 1]\n')
Steepest_Descent_Quad(Q3, q3, x0_q3)