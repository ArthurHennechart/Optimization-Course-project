function [f,x,B] = LP_Two_Phase_Simplex(A,b,c)

    canon = [A b; c' 0];

    [ic, jc] = size(canon);
    
    B = eye(ic-1);
    v = ones(1, ic-1)*-1;

    % try finding the indices of the columns of the basis corresponding
    % to an initial BFS
    for j=1:jc-1 
        for jb=1:ic-1
            if canon(1:ic-1, j) == B(:, jb)
                v(1,jb) = j;
            end
        end    
    end
    
    v2 = find(v(1,:) == -1, ic-1, 'first');
    
    % if the v vector is determined, only one phase is necessary
    if isempty(v2)
        fprintf("No need for two phase simplex method, applying one phase\n");
        [f,x,B] = LP_Simplex(A,b,c,v);
        return
    end
    
    lv2 = length(v2);
    ctmp = ones(jc-1+lv2,1);
    ctmp(1:jc-1) = 0;

    Atmp = A;
    
    for i=v2
        Atmp = [Atmp B(:,i)];
    end
    
    canon = [Atmp b; ctmp' 0];
    jc = jc + lv2;

    % recalculating the indices for the BFS vector
    for j=1:jc-1 
        for jb=1:ic-1
            if canon(1:ic-1, j) == B(:, jb)
                v(1,jb) = j;
            end
        end    
    end

    % first phase
    [~,~,B] = LP_Simplex(Atmp,b,ctmp,v);

  
    % second phase
    [f, x, B] = LP_Simplex(A,b,c,B)

    clear lv2;
    clear i;
    clear j;
    clear canon;
    clear tmp;

end

