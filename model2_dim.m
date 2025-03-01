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
d1 = 40; %cm

%front suspensions
suspension.front.upper.radius = 2; %cm
suspension.front.upper.length = sqrt((d1 + 1.2)^2+(h1 + 20.2 - tyre.radius - hub_offset)^2); %cm
suspension.front.upper.inclination = atan((h1 + 20.2 - tyre.radius - hub_offset)/(d1 + 1.2)) * 180/pi; %°

suspension.front.lower.radius = 2; %cm
suspension.front.lower.length = sqrt((d1)^2+(h1 - tyre.radius + hub_offset)^2);
suspension.front.lower.inclination = atan((h1 - tyre.radius + hub_offset)/d1) * 180/pi; %°

%rear suspension
h2 = 15; %cm
d2 = 40; %cm
suspension.rear.upper.radius = 2; %cm
suspension.rear.upper.length = sqrt((d2)^2+(h2 + 20.5 - tyre.radius - hub_offset)^2); %cm
suspension.rear.upper.inclination = atan((h2 + 20.5 - tyre.radius - hub_offset)/d2) * 180/pi; %°

suspension.rear.lower.radius = 2; %cm
suspension.rear.lower.length = sqrt((d2)^2+(h2 - tyre.radius + hub_offset)^2); %cm
suspension.rear.lower.inclination = atan((h2 - tyre.radius + hub_offset)/d2) * 180/pi; %°


 