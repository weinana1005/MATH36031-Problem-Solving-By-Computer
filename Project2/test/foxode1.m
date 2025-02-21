function dzdt=foxode1(t,z,s_r,s_f,A,E)
% Definition of ODE for fox-rabbit chase.
r=[800*-sin(s_r*t/800) 800*cos(s_r*t/800)];       % Position of rabbit
% The equations related to fox have to be discussed under two different situations.
    if Sight(z,r,A,E)==1                          % If fox get the vision of rabbit
    dist=sqrt((r(1)-z(1))^2+(r(2)-z(2))^2);       % Distance between fox and rabbit.
    dzdt=zeros(2,1);                              % Set z as a column vector.
    dzdt(1)=s_f*(r(1)-z(1))/dist;                 % Horizontal velocity of fox
    dzdt(2)=s_f*(r(2)-z(2))/dist;                 % Vertical velocity of fox
    elseif Sight(z,r,A,E)==0                      % If fox does not get the vision of rabbit
    dist=sqrt((A(1)-z(1))^2+(A(2)-z(2))^2);       % Distance between fox and point A.
    dzdt=zeros(2,1);                              % Set z as a column vector.
    dzdt(1)=s_f*(A(1)-z(1))/dist;                 % Horizontal velocity of fox
    dzdt(2)=s_f*(A(2)-z(2))/dist;                 % Vertical velocity of fox
    end
if z(2)<300                                       % Set a line for fox to come out the gate
    dzdt(1)=0;
    dzdt(2)=s_f*1;
end
end