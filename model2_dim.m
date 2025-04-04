%% Geometrical dimensions of the vehicle
% See sketch at: https://drive.google.com/file/d/1E8DDmy7k4OS2bsul31rZqGsizzR9vDdF/view?usp=sharing

%% Tyres

tyre = struct;
tyre.radius = 25.5; % [cm]
tyre.width = 20.5; % [cm]

tyre.stiffness = 1;
tyre.damping = 1;
hub_offset = 2.5; % [cm]

%[B, C, D, E]
tyre.magicformula_parameters = [0.198719422442493, 1.64946543129765, 2.37330029195307, 0.233708623192915];
%% Suspensions
suspension = struct;

%front suspensions
h1 = 15; % [cm]
d1 = 40; % [cm]
a1 = 15; % [cm]


suspension.front.upper.radius = 2; % [cm]
suspension.front.upper.length = sqrt((d1 + 1.2)^2+(h1 + 20.2 - tyre.radius - hub_offset)^2); %cm
suspension.front.upper.inclination = atan((h1 + 20.2 - tyre.radius - hub_offset)/(d1 + 1.2)) * 180/pi; %°

suspension.front.lower.radius = 2; % [cm]
suspension.front.lower.length = sqrt((d1)^2+(h1 - tyre.radius + hub_offset)^2); %cm
suspension.front.lower.inclination = atan((h1 - tyre.radius + hub_offset)/d1) * 180/pi; %°

suspension.front.stiffness = 1e3;
suspension.front.damping = 1.3;

%rear suspension
h2 = 15; % [cm]
d2 = 40; % [cm]
a2 = 15; % [cm]

suspension.rear.upper.radius = 2; % [cm]
suspension.rear.upper.length = sqrt((d2)^2+(h2 + 20.5 - tyre.radius - hub_offset)^2); %[cm]
suspension.rear.upper.inclination = atan((h2 + 20.5 - tyre.radius - hub_offset)/d2) * 180/pi; %°

suspension.rear.lower.radius = 2; % [cm]
suspension.rear.lower.length = sqrt((d2)^2+(h2 - tyre.radius + hub_offset)^2); %[cm]
suspension.rear.lower.inclination = atan((h2 - tyre.radius + hub_offset)/d2) * 180/pi; %°

suspension.rear.stiffness = 1e3;
suspension.rear.damping = 1.3;

suspension.rear.beta = atan(a2*cos(suspension.rear.lower.inclination)/(a2*sin(suspension.rear.lower.inclination) + 20.5)) * 180/pi; %°
suspension.rear.alpha = 90 - suspension.rear.beta - suspension.rear.lower.inclination; %° 

%% Simulation data
Uinf = 10; %m/s
w = Uinf / tyre.radius; % [rad/s]
