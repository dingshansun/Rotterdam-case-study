function t_wait = t_wait_metro(x, t_0)
%T_WAIT_METRO waiting time for public transit: a BPR function
%   x is the flow on the link; t_0 is the original waiting time
%   the waiting time depends on the frequency
% alpha=1.0;
% C=350;
% beta=2;
% t_wait=t_0.*(1+alpha.*(x./C).^beta);

t_wait=t_0+0.0005*x;
end
