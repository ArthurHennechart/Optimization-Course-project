function x = Newton_Method(df, d2f, x0, eps)
x = x0;
while abs(df(x)) > eps
    x = x - df(x)/d2f(x);
end
end
