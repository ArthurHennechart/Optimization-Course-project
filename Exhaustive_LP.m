function [f_opt,x_opt,B_opt] = Exhaustive_LP(A,b,c)

[m,n] = size(A);
r = rank(A);

if r ~= m || m >= n
    fprintf("This matrix doesnt fit the necessary conditions for the exhaustive method\n");
end

comb = nchoosek(1:n,m);

f_opt = inf;
x_opt = zeros(n,1);
B_opt = [];

for i = 1:size(comb,1)
    B = comb(i,:);
    AB = A(:,B);
    
    d = det(AB);
    
    % B is non inversible
    if d == 0
        continue;
    end
    
    Binv = inv(AB);

    % calculate xb = inverse of B * b
    xB = Binv*b;

    % calculate the corresponding x using the current basis
    x = zeros(n,1);
    x(comb(i,:),1) = xB;

    % using sum twice to see if x has negative components
    s = sum(sum(x<0));
    % negative components? cant be a BFS, next iteration startd
    if s ~= 0
        continue;
    end
    
    % calculate the value of the function using this x
    f = c'*x;

    if f_opt > f
        f_opt = f;
        x_opt = x;
        B_opt = B;
    end
        
   
end

end