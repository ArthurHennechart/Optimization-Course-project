function val = grad_phi(x, d, alpha)
x_new = x - alpha*d;
g = Grad_Rosenbrock(x_new);
val = g' * -d;
end
