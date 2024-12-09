clear
u_lb=[20 6 6 6 0.2 1 2]; % the interval lower bound is 180s; otherwise no more improvement
u_ub=[60 15 15 15 1 5 10]; % the interval upper bound is 600s

objFunction_1 = @(para) TTC_par(para);
objFunction_2 = @(para) Car_flow_par(para);
objFunction_3 = @(para) Operation_cost_par(para);

% PRO = UserProblem('objFcn', objFunction, 'encoding', [1 1 1 1 1 1 1], 'lower', u_lb, 'upper', u_ub);

% [Dec,Obj,Con]=
for i=1:1
    [Dec,Obj,Con]=platemo('algorithm',@NSGAII, 'objFcn', {objFunction_1,objFunction_2,objFunction_3}, 'encoding', [1 2 2 2 1 1 1], ...
        'lower', u_lb, 'upper', u_ub,...
    'N', 100, 'maxFE', 6000, 'once',1,'save',-1, 'run',i, 'metName',{'IGD','HV'});
end

