function [value, isterminal,direction]=foxrab1(t,z,s_r,mindist,B)
% ODE45 will be stopped if following two condition happened.
r=[800*-sin(s_r*t/800) 800*cos(s_r*t/800)]; % position of rabbit 
    dis=sqrt((r(1)-z(1))^2+(r(2)-z(2))^2);  % distance between fox and rabbit
    % If distance between fox and rabbit tends to 0, this event will be triggered.
    value(1)=dis-mindist;
    isterminal(1)=1;
    direction(1)= -1;
    % If distance between rabbit and burrow tends to 0, this event will be triggered.
    value(2)=r(1)-B(1);
    isterminal(2)=1;
    direction(2)= -1;
end

