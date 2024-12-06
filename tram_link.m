function [time, money] = tram_link(link_length, v_tram, tram_fare)
%TRAM_LINK Summary of this function goes here
%   Detailed explanation goes here
time=link_length/v_tram;
money=link_length*tram_fare;
end

