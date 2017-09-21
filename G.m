function plxi = G(xi)
    global a b mu
    x = xi(1);
    xhat= xi(2);
%     du = xi(3);    
    %% CDC17
    eu = - xhat * abs(xhat)^(b - 1); 
%   eu = mu;
    plxi = [x; x];% eu]; 
    
 %% pertured u and y
%     ey = - a * xhat;
%     plxi = [x; x + ey]; 