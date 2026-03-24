function val = grad2_phi(x, d, alpha)
eps = 1e-6;
val = (grad_phi(x, d, alpha+eps)-grad_phi(x, d, alpha))/eps;
end