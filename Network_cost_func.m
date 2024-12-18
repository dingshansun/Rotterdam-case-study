% function [TTC, car_flow]=Network_cost_func(para)
%% Parallel computing: all the vectors are extended to matrices

para=[50 6 6 12 6 0.27 2.2 5];
%% Network information
%% Define all the constants first
% Link lengths
L_12=7.2; L_23=9.5; L_14=4.2; L_16=5.6;L_24=5.9; L_25=8.6; L_35=9.0; L_45=6.5; L_46=4.3; L_47=3.1;
L_57=5.9; L_58=6.0; L_67=4.1; L_69=7.1; L_78=5.8; L_810=4.9; L_811=5.3; L_910=5.7; L_1011=8.7; L_710=8.4; L_34=12.9;

L_link=[L_12 L_23 L_14 L_16 L_24 L_25 L_35 L_45 L_46 L_47 L_57 L_58 L_67 L_69 L_78 L_810 L_811 L_910 L_1011 L_710 L_34];

% Speed of modes: parameter
% v_car=50;
% transit speed is fixed
v_tram=18; % km/h
v_metro=36;
v_bus=25;
v_train=80;

bus_weight=4;
bus_base=1.06; % euros
bus_fare=0.18;
tram_base=1.06;
tram_fare=0.18;
metro_base=1.06;
metro_fare=0.18;
train_base=1.1;
train_fare=0.2;
time_weight=25;
money_weight=1;
% ride_fare=3;
% ride_base=0.4;

% demand and initial path flow
% user class 
O1D1=10000;
O1D2=10000;
O2D1=10000;
O2D2=10000;
O3D1=10000;
O3D2=10000;
O4D1=10000;
O4D2=10000;
O5D1=10000;
O5D2=10000;

gamma=0.05;  % the convergence parameters to be tuned
load('Aeq.mat', 'Aeq');
beq=zeros(52,1);
beq(1)=O1D1+O1D2;
beq(2)=O2D1+O2D2;
beq(3)=O3D1+O3D2;
beq(4)=O4D1+O4D2;
beq(5)=O5D1+O5D2;
beq(6)=O1D1+O2D1+O3D1+O4D1+O5D1;
beq(7)=O1D2+O2D2+O3D2+O4D2+O5D2;

lb=zeros(228,1);  % the low bound of link flows
options = optimoptions('quadprog','Display','off');

[multi,~]=size(para);
TTC=nan(multi,1);
car_flow=nan(multi,1);

%% Parameters are put in the for loop
for i=1:multi
    Para=para(i,:);
    % take it as optimization variables; Public Transit Speed seems not adjustable!!!
    v_car=Para(1); % range from 30-80 km/h
    % v_tram=para(2);
    % v_metro=para(3);
    % v_bus=para(4);
    
    speed=[v_car v_tram v_metro v_bus v_train];
    
    % take frequency as optimization variables
    bus_freq=Para(2);
    tram_freq=Para(3); 
    metro_freq=Para(4); % veh/h
    train_freq=Para(5);
    
    freq=[bus_freq tram_freq metro_freq train_freq];
    
    % take it as optimization variables
    c_fuel=Para(6); % fuel cost per km; also including vehicle depreciation cost and road pricing strategy. It ranges from 0.2-0.5
    c_park_low=Para(7)/2; % half parking fee for single trip; range from 0-3
    c_park_high=Para(8)/2; % range from 5-10
    
    
    weight=[c_fuel c_park_low c_park_high bus_weight bus_fare tram_fare metro_fare train_fare...
        bus_base tram_base metro_base train_base time_weight money_weight];
    
    % converge criterion
    epsilon=0.3;
    converge=false;
    count=0;
    % X_link=zeros(32,1);
    X_link=500.*rand(228,1);
    X=X_link;
    % iteration
    H=diag(ones(1,228));
    
    while ~converge
        % projection
        Hf=gamma*Link_cost_func(X_link, L_link, speed, weight, freq)-X_link;
        X_link_bar= quadprog(H,Hf,[],[],Aeq,beq,lb,[],[],options);
        % adaption
        Hf_est=gamma*Link_cost_func(X_link_bar, L_link, speed, weight, freq)-X_link;
        X_link_= quadprog(H,Hf_est,[],[],Aeq,beq,lb,[],[],options);
        % convergence judgement
        Error=abs(X_link-X_link_);
        % epsilon=X_link_*1e-3;
        if all(Error<=epsilon)
            converge=true;
        end
        % save results
        X=[X X_link];
        X_link=X_link_;
        count=count+1;
    end
    UE_cost=Link_cost_func(X_link, L_link, speed, weight, freq);

    
    
    TTC(i)=X_link'*UE_cost
    car_flow(i)=sum(X_link(1:30))
end
figure
plot(X(1:30,:)');
% end