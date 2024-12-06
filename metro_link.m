function [time,money] = metro_link(link_length, v_metro, metro_fare)
%METRO_LINK Summary of this function goes here
%   Detailed explanation goes here
time=link_length/v_metro;
money=link_length*metro_fare;
end

