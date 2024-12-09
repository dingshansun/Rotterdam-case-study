function cost = Operation_cost_par(para)

        bus_freq=para(:,2);
        tram_freq=para(:,3); 
        metro_freq=para(:,4); % veh/h
        metro_cost=200.*metro_freq+4000;
        tram_cost=100.*tram_freq+2000;
        bus_cost=50.*bus_freq+1000;
        cost=metro_cost+tram_cost+bus_cost;

end

