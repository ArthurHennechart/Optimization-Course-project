function x = Secant_Method(df, x0, x1, eps)
while abs(df(x1)) > eps
    x2 = x1 - df(x1)*(x1-x0)/(df(x1)-df(x0));
    x0 = x1;
    x1 = x2;
end
x = x1;
end