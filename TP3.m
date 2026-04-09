clc; clear; close all;
fprintf('Partie 3\n');

%% 3.1
fprintf('3.1:\n');
rosen = @(x) 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;

[xmin, fval] = fminunc(rosen, [-1, -1]);
fprintf("By using the fminunc function :\n the minimum is %.6f and it is reached at [%.6f, %.6f]\n", fval, xmin(1), xmin(2));

x0 = [-1,2];
eps1 = 1e-3; %convergence
eps2 = 1e-4; %line search
x_rosen = Steepest_Descent_Rosen(x0, eps1, eps2);

fprintf('\nRosenbrock Steepest Descent:\n');
fprintf('x_min = [%.6f, %.6f]\n',x_rosen(1), x_rosen(2));
fprintf('f(x_xmin) = %.6f\n\n', 100*(x_rosen(2)-x_rosen(1)^2)^2 + (1-x_rosen(1))^2);

%% 3.2
fprintf('3.2:\n');
x0 = [1/2; 5/4];
g = [2*x0(1)*(8*x0(1)^2 - 4*x0(2)) + 6*x0(1); -2*(2*x0(1)^2 - x0(2)) - 1];
H = [2*(24*x0(1)^2 - 4*x0(2)) + 3, -8*x0(1); -8*x0(1), 2];
alpha = (g'*g)/(g'*H*g);
x1 = x0 - alpha*g;

fprintf('Initial x0 = [%.2f,%.2f]\n', x0(1), x0(2));
fprintf('Gradient g0 = [%.4f,%.4f]\n', g(1), g(2));
fprintf('Step size alpha = %.6f\n', alpha);
fprintf('x after 1 iteration = [%.6f, %.6f]\n\n', x1(1), x1(2));

H = [2*(24*x1(1)^2 - 4*x1(2) + 3), -8*x1(1); -8*x1(1), 2];
veigs = eig(H);
fprintf("The eigenvalues of the Hessian matrix for x1 are (%0.3f, %0.3f), since theyre both strictly positive, H is definite positive and f is convex at x1\n\n", veigs(1), veigs(2));


%% 3.3

% we chose random values for q1, x0 and lambda
fprintf('3.3:\n');
Q1 = 6*eye(2);
q1 = [-10;-1];
x0_q1 = [-3;-8];
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

fprintf("\nIn terms of convergence speed : \n");
fprintf("Case 1 converges in just 1 step\n");
fprintf("Then comes Case 3 with 15 steps\n");
fprintf("The slowest to converge is Case 2 with 50 steps\n");

clear;