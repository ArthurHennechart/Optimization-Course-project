function Steepest_Descent_Quad(Q, q, x0)
x = x0;
X = x';
n = 0;
for k = 1:50
    g = Q*x +q;
    if norm(g) < 1e-6
        break;
    end
    alpha = (g'*g)/(g'*Q*g);
    x = x - alpha*g;
    X = [X; x'];
    n = n + 1;
end
figure; hold on; grid on;
plot(X(:,1), X(:,2), 'o-', 'LineWidth', 1.5);
xlabel('x1');
ylabel('x2');
t = strcat('Steepest Descent - Quadratic Function done in:',num2str(n));
t = strcat(t, " iterations");
title(t);
end