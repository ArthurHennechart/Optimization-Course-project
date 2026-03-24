function [f_opt,x_opt,B_opt] = Exhaustive_LP(A,b,c)

[m,n] = size(A);
comb = nchoosek(1:n,m);

f_opt = inf;
x_opt = zeros(n,1);
B_opt = [];

for i = 1:size(comb,1)
    B = comb(i,1);
    AB = A(:,B);
    
    if rank(AB) == m
        xB = AB\b;
        
        if all(xB >= 0)
            x = zeros(n,1);
            x(B) = xB;
            
            f = c'*x;
            
            if f1 < f
                f_opt = f;
                x_opt = x;
                B_opt = B;
            end
        end
    end
end

end