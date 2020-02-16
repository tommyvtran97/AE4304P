figure(5)
plot(t, y(:,1), t, y_pd(:,1))
xlabel('time [s]'); ylabel('u/V [-]'); title('Airspeed Deviation');
legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
grid on;
set(gcf, 'Position',  [0, 0, 1100, 600])
if save == 'y'
saveas(gcf,[pwd,'\Plots\Airspeed_turbulence_response'],'epsc');
end 

figure(6)
plot(t, y(:,2), t, y_pd(:,2))
xlabel('time [s]'); ylabel('\alpha [rad]'); title('Angle of Attack');
legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
grid on;
set(gcf, 'Position',  [0, 0, 1100, 600])
if save == 'y'
saveas(gcf,[pwd,'\Plots\AoA_turbulence_response'],'epsc');
end 

figure(7)
plot(t, y(:,3), t, y_pd(:,3))
xlabel('time [s]'); ylabel('\theta [rad]'); title('Pitch Angle');
legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
grid on;
set(gcf, 'Position',  [0, 0, 1100, 600])
if save == 'y'
saveas(gcf,[pwd,'\Plots\Pitch_turbulence_response'],'epsc');
end

figure(8)
plot(t, y(:,4), t, y_pd(:,4))
xlabel('time [s]'); ylabel('qc/V [rad]'); title('Pitch Rate');
legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
grid on;
set(gcf, 'Position',  [0, 0, 1100, 600])
if save == 'y'
saveas(gcf,[pwd,'\Plots\PitchRate_turbulence_response'],'epsc');
end

figure(9)
plot(t, y(:,8), t, y_pd(:,8))
xlabel('time [s]'); ylabel('N_z [g-unit]'); title('Load Factor');
legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
grid on;
set(gcf, 'Position',  [0, 0, 1100, 600])
if save == 'y'
saveas(gcf,[pwd,'\Plots\LoadFactor_turbulence_response'],'epsc');
end 