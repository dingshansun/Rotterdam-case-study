function [time, money] = bus_link(link_length, v_bus, bus_fare)
%BUS_LINK Summary of this function goes here
%   Detailed explanation goes here

time=link_length/v_bus;
money=link_length*bus_fare;

end

