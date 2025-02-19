%%
clear; close all; clc;
load('B1654run55.mat')
%% 
figure
plot(SR, FX)

figure;
yyaxis left
plot(TSTC)
hold on
plot(TSTI)
hold on
plot(TSTO)
hold on
yyaxis right
plot(IA)

%%
T_AVG = (TSTC + TSTI + TSTO)/3;
figure
plot(SR, FX./(T_AVG+273))
%%
m = 1:length(SR);
sp = spline(m,SR - 0.11);
z = fnzeros(sp);
z = round(z(1,:)); % list of the index of the zeros
z = z(2:2:end); % 1 cycle = 2 zero crossing

% !!!!!!!! find a best way to divide in cycles

figure;
plot(ET, SR, ET(z(1):z(2)), SR(z(1):z(2)))

%%
%p1 = 70 kpa
%p2 = 83 kpa
%p3 = 97 kpa
figure
for i = 2:length(z)
    time = ET(z(i-1):z(i));
    SR_i = SR(z(i-1):z(i));
    NFX_i = - NFX(z(i-1):z(i));
    % plot(time, SR_i)
    %hold on;
    if i == 5
        [params_fit, NFx_fit] = magic_curve_fit2(SR_i, NFX_i);
        plot(SR_i, NFX_i, SR_i, NFx_fit,'o')
    end
    
end
