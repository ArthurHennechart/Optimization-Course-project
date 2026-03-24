function x = Steepest_Descent_Rosen(x0, eps1, eps2)
x = x0;
while true
    g = Grad_Rosenbrock(x);
    d = -g;
    alpha = 0.1;
    while true
        phi1 = grad_phi(x, d, alpha);
        phi2 = grad2_phi(x, d, alpha);
        alpha_new = alpha - phi1/phi2;
        if abs(alpha_new-alpha)/max(1, abs(alpha)) < eps2
            break;
        end
        alpha = alpha_new;
    end
    x_new = x + alpha * d;
    if norm(x_new-x)/max(1,norm(x)) < eps1
        break;
    end
    x=x_new;
end
end