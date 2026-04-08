function g = Grad_Rosenbrock(x)
g = [-400*x(1)*(x(2)-x(1)^2) + 2*(x(1)-1); 200*(x(2)-x(1)^2)];

end
