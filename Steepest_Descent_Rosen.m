function x = Steepest_Descent_Rosen(x0, eps1, eps2)
x = x0;
%x(1) = -x(1);
x = x'
X=[x]
n = 0
while true
    g = Grad_Rosenbrock(x);
    %d = -g
    alpha = 0.1;
    while true
        phi1 = grad_phi(x, g, alpha);
        phi2 = grad2_phi(x, g, alpha);
        alpha_new = alpha - phi1/phi2;
        if abs(alpha_new-alpha)/max(1, abs(alpha)) < eps2
            break;
        end
        alpha = alpha_new;
    end
    x_new = x - alpha * g;

    r = norm(x_new-x);
    if (norm(x)<=0)
        r = 0;
    else
        r = r / norm(x);
    end

    if r < eps1
        break;
    end
    n = n + 1;
    x=x_new;
    X = [X x];
end

figure; hold on; grid on;
plot(X(1,:), X(2,:), 'o-', 'LineWidth', 1.5);
xlabel('x1');
ylabel('x2');
t = strcat('Steepest Descent on Rosebrock function done in :',num2str(n));
t = strcat(t, " iterations");
title(t);

end