figure(3)
pzmap(aircraft)
grid on
set(gcf, 'Position',  [0, 0, 1100, 600])
if save == 'y'
saveas(gcf,[pwd,'\Plots\Pz_aircraft'],'epsc');
end

figure(4)
pzmap(aircraft_pd)
grid on
set(gcf, 'Position',  [0, 0, 1100, 600])
if save == 'y'
saveas(gcf,[pwd,'\Plots\Pz_pd_aircraft'],'epsc');
end 