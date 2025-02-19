function [params_fit, NFY_fit] = magic_curve_fit2(x, y)
% Magic Formula 
magic_formula = @(params, x) params(3) * sin(params(2) * atan(params(1) * x - params(4) * (params(1) * x - atan(params(1) * x)))) + params(5);
% First guess: [B, C, D, E]
%The first guess of the B parameter can be improved by taking stiffness at
% the origin / (C*D)
params0 = [1, 1.5, 3, 0.9, 0];
options = optimoptions('lsqcurvefit', 'Display', 'on');
params_fit = lsqcurvefit(magic_formula, params0, x, y, [], [], options);
NFY_fit = magic_formula2(params_fit, x); %fited points
end