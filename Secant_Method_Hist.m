function [x, x_hist] = Secant_Method_Hist(df, x0, x1, eps)
x_hist = [x0 x1];

% main loop with the stopping criteria being (df/dx(x) <= eps)
while abs(df(x1)) > eps
    
    % applying the formula :
    % xk+1 = xk - df(xk) * (xk-xk-1) / (df(xk)-df(xk-1))
    x2 = x1 - df(x1)*(x1-x0)/(df(x1)-df(x0));
    x0 = x1;
    x1 = x2;

    % to save all points that were calculated as to graphically
    % show them later
    x_hist = [x_hist x1];
end

% final result
x = x1;

end