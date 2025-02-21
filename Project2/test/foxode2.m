function dzdt=foxode2(t,z,s_r0,s_f0,A,E,u_r,u_f)
% Definition of the second ODE.
f_p=z(1:2);                                 % position of fox
r_p=z(3:4);                                 % position of rabbit
d_f=z(5);                                   % Distance travelled by the fox in time t
d_r=z(6);                                   % Distance travelled by the rabbit in time t
s_f=s_f0*exp(-u_f*d_f);                     % diminishing speed of fox
s_r=s_r0*exp(-u_r*d_r);                     % diminishing speed of rabbit
dzdt=zeros(6,1);                            % set a vector of dzdt
% Circular path parameters
radius = 800;                               % Radius of the circle
angular_velocity = s_r / radius;            % Angular velocity (radians per unit time)
% Set rabbit's velocity for circular path
dzdt(3) = -angular_velocity * (r_p(2));     % Horizontal velocity component for circular path
dzdt(4) = angular_velocity * (r_p(1));      % Vertical velocity component for circular path
dzdt(5)=s_f;                                % Speed of fox.
dzdt(6)=s_r;                                % Speed of rabbit
   if Sight(f_p,r_p,A,E)==1            % If the rabbit in fox's sight, then direct to rabbit 
   d=sqrt((r_p(1)-f_p(1))^2+(r_p(2)-f_p(2))^2);
   dzdt(1)=s_f*(r_p(1)-f_p(1))/d;      % the velocity of fox if towards rabbit
   dzdt(2)=s_f*(r_p(2)-f_p(2))/d;
   elseif Sight(f_p,r_p,A,E)==0        % If the fox's don't have sight, fox toward A
   d=sqrt((A(1)-f_p(1))^2+(A(2)-f_p(2))^2);
   dzdt(1)=s_f*(A(1)-f_p(1))/d;        % The velocity of fox if towards A
   dzdt(2)=s_f*(A(2)-f_p(2))/d;
   end
if z(2)<300
    dzdt(1)=0;
    dzdt(2)=s_f*1;
end
end
