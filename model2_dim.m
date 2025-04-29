%% Geometrical dimensions of the vehicle
% See sketch at: https://drive.google.com/file/d/1E8DDmy7k4OS2bsul31rZqGsizzR9vDdF/view?usp=sharing

%% Vehicle propreties

vehicle = struct;
vehicle.totalmass = 1000; %kg
vehicle.l = 3 ; %m
vehicle.l1 = 1.3 ; %m
vehicle.l2 = 1.7 ; %m
vehicle.h = 0.3; %m HEIGHT OF THE GRAVITY CENTER OF THE CAR
vehicle.mu_a = 0.9 ; %adherence
vehicle.mu_g = 0.3;

%% Electric motor

motor = struct;
motor.efficiency = 0.95;
motor.gearratio = 8;
motor.maxpower = 80000;
motor.maxtorque = 420;
motor.torque_speed = torque_speed_curve;
%Provisoire
drivetrain = struct;
drivetrain.i_tot = 3; %kgm^2

%% Braking system

brake = struct;
brake.gain = 10;
brake.brakefraction = 0.3;

%% Tyres

tyre = struct;
tyre.radius = 25.5; % [cm]
tyre.dynamic_radius = 0.98*tyre.radius; %cm
tyre.width = 20.5; % [cm]
tyre.Cr = 0.015; %PROVISOIRE

tyre.stiffness = 1;
tyre.damping = 1;
hub_offset = 2.5; % [cm]

tyre.mass = 8; % [kg] estimated values
tyre.volume = pi*(tyre.radius/100)^2 * (tyre.width/100);
tyre.density = tyre.mass/tyre.volume;

%[B, C, D, E]
tyre.magicformula_parameters = [0.198719422442493, 1.64946543129765, 2.37330029195307, 0.233708623192915];

filename = 'fsae190_50R10.tir';
tireParams = simscape.multibody.tirread(filename);

%Provisoire
wheel.inertia1 = 0.158067; %kgm^2
wheel.inertia2 = 0.158067; %kgm^2

wheel.s6dof.stiffness = 0;
wheel.s6dof.damping = 0;

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

suspension.front.stiffness = 3e6;
suspension.front.damping = 1.5e4;
suspension.front.eq = 0.209325; %[m]
suspension.front.distance_revolute = 10; % [cm]

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

suspension.rear.stiffness = 3e6;
suspension.rear.damping = 1.5e4;
suspension.rear.distance_revolute = 10; % [cm]
suspension.rear.eq = 0.212315; % [m]


suspension.rear.beta = atan(a2*cos(suspension.rear.lower.inclination)/(a2*sin(suspension.rear.lower.inclination) + 20.5)) * 180/pi; %°
suspension.rear.alpha = 90 - suspension.rear.beta - suspension.rear.lower.inclination; %° 

%% Simulation data
Uinf = 10; %m/s
w = Uinf / (tyre.radius /100); % [rad/s]

%% Aerodynamics:
% forces normalized by the speed squared : F = coef*abs(v)^2
Aero = struct;
Aero.Lift_reduced = -0.775;
Aero.Drag_reduced = 0.837; 

g = 9.81;
slope_angle = 0;