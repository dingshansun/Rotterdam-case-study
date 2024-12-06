function t_wait = t_wait_tram(x, t_0)
%T_WAIT_TRAM waiting time for public transit: a BPR function
%   x is the flow on the link; t_0 is the original waiting time
%   the waiting time depends on the frequency
% alpha=0.8;
% C=250;
% beta=2;
% t_wait=t_0*(1+alpha*(x/C)^beta);

t_wait=t_0+0.00075*x;

end

