function Steepest_Descent_Quad(Q, q, x0)
x = x0;

% history of points visited
hist = x';

% number of steps taken;
n = 0;
for k = 1:50
    g = Q*x +q;
    if norm(g) < 1e-6
        break;
    end
    alpha = (g'*g)/(g'*Q*g);
    x = x - alpha*g;
    hist = [hist; x'];
    n = n + 1;
end
figure; hold on; grid on;
plot(hist(:,1), hist(:,2), 'o-', 'LineWidth', 1.5);
xlabel('x1');
ylabel('x2');
t = strcat('Steepest Descent - Quadratic Function done in:',num2str(n));
t = strcat(t, " iterations");
title(t);
end