function t_park = t_findpark(x, t_0)
%T_FINDPARK Summary of this function goes here
%   The time to park needs to be further refined; parameters should be
%   adjusted
alpha=2.5;
C=250;
beta=2;
t_park=t_0.*(1+alpha.*(x./C).^beta);
end

