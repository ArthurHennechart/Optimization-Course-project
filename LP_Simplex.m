function [f,x,B] = LP_Simplex(A,b,c,v)
    clear f;
    clear x;
    clear B;
    clear canon;

    f = 0;
    x = 0;

    canon = [A b'];
    canon = vertcat(canon, [c 0]);

    B = A(:, v);

    Binv = inv(B);


    [ib, jb] = size(Binv);
    
    tmp = [Binv zeros(ib, 1); zeros(1, jb), 1];
    clear Binv;

    tmp = tmp * canon
    
    [ic, jc] = size(canon);
    for j = v
        if (tmp(ic,j) ~= 0)
            i = find(tmp(:,j)==1,1,'first');
            tmp(ic, :) = tmp(ic, :) - tmp(ic, j)*tmp(i, :);
        end
    end

    fprintf("After nulling the basic variables of the last row\n");
    tmp

    fini = false;

    q = 0;
    p = 0;
    minvq = 0;
    minvp = [];
    minvpi = [];

    while fini == false
        firstmin = true;
        fini = true;
        minvp = [];
        minvpi = [];

        % finding rj < 0 for p
        minvq = min(tmp(ic, 1:jc-1));
        if (minvq >= 0) % rj is positive, method over
            fprintf("Simplex method done, minimum value positive\n");
            break;
        end
        fini = false;

        q = find(tmp(ic, 1:jc-1)==minvq,1,'first');

        % finding p
        for i = 1:ic-1
            if (tmp(i,q) <= 0)
                continue;
            end
            minvp = [minvp, tmp(i,jc)/tmp(i,q)];
            minvpi = [minvpi i];
        end
        
        if (isempty(minvp) == true)
            fprintf("Error, there are no yi0/yiq coefficients that are strictly positive, the problem is unbounded\n");
            break;
        end
        minvp
        minvpi
        p = find(minvp==min(minvp),1,"first")
        p = minvpi(1,p)
        
        tmp(p,:) = tmp(p,:) / tmp(p,q)
        for i = 1:ic
            if i == p
                continue;
            end

            tmp(i,:) = tmp(i,:) - (tmp(i,q)/tmp(p,q));
        end
        
        tmp
    end
    
    clear i;
    clear ib;
    clear ic;
    clear jb;
    clear jc;

    f = tmp;

    clear tmp;
    
end