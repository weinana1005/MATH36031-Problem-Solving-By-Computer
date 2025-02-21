%% Question 1
s_r = 12;                                               % Speed of rabbit
s_f = 17;                                               % Speed of fox
A = [-350,620];                                         % Set Point A
E = [-500,350];                                         % Set Point E
z0 = [0,0];                                             % Fox start chasing with point z0
ts = [0,100];                                           % Time span from 0 to 100 seconds
mindist = 0.1;                                          % Minimum distance
B = [800*(-sin(pi/3)), 800*cos(pi/3)];                  % B represents the point of Burrow
% Solve the ODE using event function and ode45
options = odeset('Events', @(t,z)foxrab1(t,z,s_r,mindist,B),'RelTol',1e-9); 
[t, z, te, ze, zi] = ode45(@(t,z)foxode1(t,z,s_r,s_f,A,E), ts, z0, options);
te,ze,fd=te*s_f,zi
backgroundplot(A, E, z0);                               % Plot background
% Plot the paths of fox and rabbit
plot(z(:,1), z(:,2), 800*-sin(s_r*t/800), 800*cos(s_r*t/800));

%% Question 2
s_r0=12;                    % Speed of rabbit at t = 0.
s_f0=17;                    % Speed of fox at t = 0.
A=[-350,620];               % Set Point A
E=[-500,350];               % Set Point E
mindist=0.1;                % Minimum distance
u_f=0.0002;                 % Rate of the diminishing speed of fox
u_r=0.0008;                 % Rate of the diminishing speed of rabbit
z0=[0;0;0;800;0;0];         % z1 & z2 imply the position of Fox while z3 & z4 represent the rabbit's 
                            % position. z5 is distance travelled by fox, z6 is the distance travelled by rabbit.
ts = [0,100];   
options2=odeset('Events', @(t,z)foxrab2(t,z,s_r,mindist,B),'RelTol',1e-9); 
[t,z,te,ze,zi]=ode45(@(t,z)foxode2(t,z,s_r0,s_f0,A,E,u_r,u_f),ts,z0,options2);
te,fp=ze(3:4),fd=ze(5),zi
backgroundplot(A,E,z0);     % Plot background
plot(z(:,1),z(:,2),z(:,3),z(:,4));