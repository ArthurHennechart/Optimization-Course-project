function x = Steepest_Descent_Rosen(x0, eps1, eps2)
x = x0;
x = x';

% history of all points visited
hist=[ x ];

% number of steps taken
n = 0;

%% the main loop
while true
    % get the corresponding gradient with x
    g = Grad_Rosenbrock(x);
    
    % init our alpha to 0.1 as was asked
    alpha = 0.1;

    % calculation of alpha with newtons method
    while true

        % value of gradient with x - alpha*g
        phi1 = grad_phi(x, g, alpha);
        
        % value of hessian with x - alpha*g
        phi2 = grad2_phi(x, g, alpha);

        % ak+1 = ak - f'(x-a*g)/f''(x-a*g);
        alpha_new = alpha - phi1/phi2;
        if abs(alpha_new-alpha)/max(1, alpha) < eps2
            break;
        end
        alpha = alpha_new;
    end

    % xk+1 = x - a*g
    x_new = x - alpha * g;

    % check if the stopping criteria was reached
    r = norm(x_new-x);
    if (norm(x)<=0)
        r = 0;
    else
        r = r / norm(x);
    end

    if r < eps1
        break;
    end

    % update number of steps
    n = n + 1;

    % update x
    x=x_new;

    % update the list of visited points
    hist = [hist x];
end

% draw the convergence
figure; hold on; grid on;
plot(hist(1,:), hist(2,:), 'o-', 'LineWidth', 1.5);
xlabel('x1');
ylabel('x2');
t = strcat('Steepest Descent on Rosebrock function done in :',num2str(n));
t = strcat(t, " iterations");
title(t);

end