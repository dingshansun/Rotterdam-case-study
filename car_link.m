function [time,money] = car_link(link_length,flow, para)
%CAR_LINK output the time and money cost on the car link
%   Time is the BPR function and money is the linear function

%% Parameters
v_car=para(1);
c_fuel=para(2);
%% Calculation of costs
t_0=link_length/v_car;
alpha=0.5;
C=1000;
beta=4;
time=t_0.*(1+alpha.*(flow./C).^beta);

money=c_fuel*link_length;
end

