function [x, x_hist] = Newton_Method_Hist(df, d2f, x0, eps)
x = x0;

% keep track of our points
x_hist = x;

% stopping criteria, self explanatory
while abs(df(x)) > eps
    x = x - df(x)/d2f(x);
    x_hist = [x_hist x];
end
end