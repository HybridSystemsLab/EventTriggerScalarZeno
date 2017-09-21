function v = C(xi)
    global a b sigma
    x = xi(1);
    xhat = xi(2);
%% CDC17
    if abs(xhat - x) - sigma * abs(x) <= 0
        v = 1;
    else
        v = 0;
    end
    
 %% pertured u and y
%     ey = - a * xhat;
%     if b * abs(xhat + ey - x) - a * abs(x) <= 0
%         v = 1;
%     else
%         v = 0;
%     end