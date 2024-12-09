classdef CEC2017_F20 < PROBLEM
% <single> <real> <constrained>
% CEC'2017 constrained optimization benchmark problem

%------------------------------- Reference --------------------------------
% G. Wu, R. Mallipeddi, and P. N. Suganthan, Problem definitions and
% evaluation criteria for the CEC 2017 competition on constrained real-
% parameter optimization, National University of Defense Technology, China,
% 2016.
%------------------------------- Copyright --------------------------------
% Copyright (c) 2024 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

    properties
        O;  % Optimal decision vector
    end
    methods
        %% Default settings of the problem
        function Setting(obj)
            CallStack = dbstack('-completenames');
            load(fullfile(fileparts(CallStack(1).file),'CEC2017.mat'),'Data');
            obj.O = Data{12}.o;
            obj.M = 1;
            if isempty(obj.D); obj.D = 10; end
            obj.D = min(obj.D,length(obj.O));
            obj.lower    = zeros(1,obj.D) - 100;
            obj.upper    = zeros(1,obj.D) + 100;
            obj.encoding = ones(1,obj.D);
        end
        %% Calculate objective values
        function PopObj = CalObj(obj,PopDec)
            Y = PopDec - repmat(obj.O(1:size(PopDec,2)),size(PopDec,1),1);
            Y = Y.^2;
            PopObj = sum(0.5+(sin(sqrt(Y(:,1:end-1)+Y(:,2:end))).^2-0.5)./(1+0.001*sqrt(Y(:,1:end-1)+Y(:,2:end))).^2,2) + ...
                     0.5+(sin(sqrt(Y(:,end)+Y(:,1))).^2-0.5)./(1+0.001*sqrt(Y(:,end)+Y(:,1))).^2;
        end
        %% Calculate constraint violations
        function PopCon = CalCon(obj,PopDec)
            Y = PopDec - repmat(obj.O(1:size(PopDec,2)),size(PopDec,1),1);
            Y = sum(Y,2);
            PopCon(:,1) = cos(Y).^2 - 0.25*cos(Y) - 0.125;
            PopCon(:,2) = exp(cos(Y)) - exp(0.25);
        end
    end
end