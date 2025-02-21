function [value, isterminal, direction] = foxrab2(t, z, s_r, mindist, B)
    % ODE45 will be stopped if the following conditions happen.
    % Extract the positions of the fox and rabbit from the state vector z
    f_p = [z(1), z(2)]; % Position of fox
    r_p = [z(3), z(4)]; % Position of rabbit 
    % Distance between fox and rabbit
    dis= norm(f_p - r_p);
    value(1)=dis-mindist;
    isterminal(1)=1;
    direction(1)= -1;
    % If distance between rabbit and burrow tends to 0, this event will be triggered.
    value(2)=r_p(1)-B(1);
    isterminal(2)=1;
    direction(2)= -1;
end


