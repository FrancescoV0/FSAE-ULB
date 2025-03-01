%% Tyres

tyre = struct;
tyre.radius = 25.5; %cm
tyre.width = 20.5; %cm

tyre.stiffness = 1;
tyre.damping = 1;

%% Suspensions
suspension = struct;

h1 = 15; %cm
hub_offset = 2.5; %cm
d = 30; %cm

%front suspensions
suspension.front.upper.radius = 2; %cm
suspension.front.upper.length = 1;

suspension.front.lower.radius = 2; %cm
suspension.front.lower.length = 1;


%rear suspension
suspension.rear.upper.radius = 2; %cm
suspension.rear.upper.length = sqrt((d)^2+(h1 + 20.5 - tyre.radius - hub_offset)^2); %cm
suspension.rear.upper.inclination = atan((h1 + 20.5 - tyre.radius - hub_offset)/d) * 180/pi; %°

suspension.rear.lower.radius = 2; %cm
suspension.rear.lower.length = sqrt((d)^2+(h1 - tyre.radius + hub_offset)^2); %cm
suspension.rear.lower.inclination = atan((h1 - tyre.radius + hub_offset)/d) * 180/pi; %°


 