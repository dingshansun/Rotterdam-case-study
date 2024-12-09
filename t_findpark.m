function t_park = t_findpark(x, t_0)
%T_FINDPARK Summary of this function goes here
%   The time to park needs to be further refined; parameters should be
%   adjusted
    alpha=0.25;
    C=2500;
    beta=10;
    t_park=t_0.*(1+alpha.*(x./C).^beta);
end

