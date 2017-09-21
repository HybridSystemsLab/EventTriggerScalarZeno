function dxi = f(xi)
    global a b mu
    x = xi(1);
    xhat = xi(2);
%     du = xi(3);
%% CDC17
    eu = - xhat * abs(xhat)^(b - 1); 
%   eu = du;
    dxi = [- xhat + eu; 0];% 0];
    
%% pertured u and y
%     eu = - xhat * abs(xhat)^(b - 1); 
%     ey = - a * xhat;
%     
%     dxi = [- xhat + eu; ey];