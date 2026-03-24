function x_opt = Golden_Section(f, a, b, eps)

phi=(1+sqrt(5))/2;

while b-a > eps
    x1= b - (b-a)/phi;
    x2= a + (b-a)/phi;

    if f(x2) > f(x1)
        b=x2;
    else
        a=x1;
    end
end

x_opt = (a+b)/2;