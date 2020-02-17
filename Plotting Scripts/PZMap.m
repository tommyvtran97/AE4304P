figure(3)
pzmap(aircraft, 'r')
grid on
set(gcf, 'Position',  [0, 0, 1100, 600])
hm = findobj(gca, 'Type', 'Line');          % Handle To 'Line' Objects
hm(2).MarkerSize = 20;                      % Zero Marker
hm(3).MarkerSize = 20;                      % Pole Marker
if save == 'y'
saveas(gcf,[pwd,'\Plots\Pz_aircraft'],'epsc');
end

figure(4)
pzmap(aircraft_pd, 'g')
grid on
set(gcf, 'Position',  [0, 0, 1100, 600])
hm = findobj(gca, 'Type', 'Line');          % Handle To 'Line' Objects
hm(2).MarkerSize = 20;                      % Zero Marker
hm(3).MarkerSize = 20;                      % Pole Marker
if save == 'y'
saveas(gcf,[pwd,'\Plots\Pz_pd_aircraft'],'epsc');
end 

