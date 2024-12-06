function [time,money] = rail_link(link_length, v_train, train_fare)
%RAIL_LINK Summary of this function goes here
%   Detailed explanation goes here
time=link_length/v_train;
money=link_length*train_fare;
end

