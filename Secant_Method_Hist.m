function [x, x_hist] = Secant_Method_Hist(df, x0, x1, eps)
x_hist = [x0 x1];
while abs(df(x1)) > eps
    x2 = x1 - df(x1)*(x1-x0)/(df(x1)-df(x0));
    x0 = x1;
    x1 = x2;
    x_hist = [x_hist x1];
end
x = x1;
end