%% Logs out:
Table = out.logsout.extractTimetable;
out.SimulationMetadata.TimingInfo
writetimetable(Table, 'logsout.xlsx');
%% Plots
close all;
figure()
plot(Table.Time, Table.("chassis speed (chassis ref)"), 'LineWidth', 1)
title('Chassis speed (chassis axis)')
xlabel('time [s]');
ylabel('Speed [m/s]');
legend({'xdot', 'ydot', 'zdot'});
grid();

figure()
plot(Table.Time, Table.speed_tr, 'LineWidth', 1)
title('Chassis speed (world axis)')
xlabel('time [s]');
ylabel('Speed [m/s]');
legend({'xdot', 'ydot', 'zdot'});
grid();

%Cornering forces
figure();
plot(Table.Time, Table.Fy_FL, Table.Time, Table.Fy_FR, Table.Time, Table.Fy_RL, Table.Time, Table.Fy_RR, 'LineWidth', 1);
title('Cornering forces')
xlabel('time [s]');
ylabel('Force [N]');
legend({'FL', 'FR', 'RL', 'RR'});
grid();

% Aerodynamic forces
figure();
plot(Table.Time, Table.Aero_downforce, Table.Time, Table.Aero_drag, Table.Time, Table.Aero_lateralforce, 'LineWidth', 1);
title('Aerodynamic forces')
xlabel('time [s]');
ylabel('Force [N]');
legend({'Down focre', 'Drag', 'Lat'});
grid();

% Slip angles
figure();
plot(Table.Time, Table.("Effective slip angle_FL"), Table.Time, Table.("Effective slip angle_FR"), Table.Time, Table.("Effective slip angle_RL"), Table.Time, Table.("Effective slip angle_RR"), 'LineWidth', 1)
title('Slip angles')
xlabel('time [s]');
ylabel('SA [°]');
legend({'FL', 'FR', 'RL', 'RR'});
grid();

% Position (time implicit)
figure();
plot(Table.pos(:,1), Table.pos(:,2),'LineWidth', 1)
hold on
plot(Table.pos(1,1), Table.pos(1,2), 'o') % Origin
title('Trajectory')
xlabel('x [m]');
ylabel('y [m]');
grid();

