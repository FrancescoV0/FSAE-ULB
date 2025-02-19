vehicle = struct;
vehicle.dimensionchassis = [3, 1, 1];
deltaX = sqrt(1-0.25^2);
deltaY = 1.2 - 0.35;
upper_arm_length = sqrt(deltaX^2 + deltaY^2);
lower_arm_length = 1;
alpha_upper = acos(deltaX/upper_arm_length) * 180/pi;

deltaY2 = 0.25;
alpha_lower = acos(deltaX/1) * 180/pi;