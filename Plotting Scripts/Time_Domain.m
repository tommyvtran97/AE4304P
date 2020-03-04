% figure(5)
% plot(t, y(:,1), 'b-', t, y_pd(:,1))
% xlabel('time [s]'); ylabel('u/V [-]'); title('Airspeed Deviation');
% legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
% grid on;
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\Airspeed_turbulence_response'],'epsc');
% end 
% 
% figure(6)
% plot(t, y(:,2), 'b-', t, y_pd(:,2))
% xlabel('time [s]'); ylabel('\alpha [rad]'); title('Angle of Attack');
% legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
% grid on;
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\AoA_turbulence_response'],'epsc');
% end 
% 
% figure(7)
% plot(t, y(:,3), 'b-', t, y_pd(:,3))
% xlabel('time [s]'); ylabel('\theta [rad]'); title('Pitch Angle');
% legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
% grid on;
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\Pitch_turbulence_response'],'epsc');
% end
% 
% figure(8)
% plot(t, y(:,4), 'b-', t, y_pd(:,4))
% xlabel('time [s]'); ylabel('qc/V [rad]'); title('Pitch Rate');
% legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
% grid on;
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\PitchRate_turbulence_response'],'epsc');
% end
% 
% figure(9)
% plot(t, y(:,8), 'b-', t, y_pd(:,8))
% xlabel('time [s]'); ylabel('N_z [g-unit]'); title('Load Factor');
% legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
% grid on;
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\LoadFactor_turbulence_response'],'epsc');
% end 

figure(3)
subplot(321)
plot(t, y(:,1), 'b-', t, y_pd(:,1))
xlabel('time [s]'); ylabel('u/V [-]'); %title('Airspeed Deviation');
legend('Pitch Damper OFF', 'Pitch Damper ON', 'Fontsize', 15);
grid on;
set(gca,'FontSize',18)

subplot(322)
plot(t, y(:,2), 'b-', t, y_pd(:,2))
xlabel('time [s]'); ylabel('\alpha [rad]'); %title('Angle of Attack');
%legend('Pitch Damper OFF', 'Pitch Damper ON');
grid on;
set(gca,'FontSize',18)

subplot(323)
plot(t, y(:,3), 'b-', t, y_pd(:,3))
xlabel('time [s]'); ylabel('\theta [rad]'); %title('Pitch Angle');
%legend('Pitch Damper OFF', 'Pitch Damper ON');
grid on;
set(gca,'FontSize',18)

subplot(324)
plot(t, y(:,4), 'b-', t, y_pd(:,4))
xlabel('time [s]'); test1 = ylabel('qc/V [rad]'); %title('Pitch Rate');
%legend('Pitch Damper OFF', 'Pitch Damper ON');
test1.Position(1) = test1.Position(1) - 3.3;
grid on;
set(gca,'FontSize',18)

subplot(325)
plot(t, y(:,8), 'b-', t, y_pd(:,8))
xlabel('time [s]'); ylabel('N_z [g-unit]'); %title('Load Factor');
%legend('Pitch Damper OFF', 'Pitch Damper ON');
grid on;
set(gca,'FontSize',18)
set(gcf, 'Position',  [0, 0, 1500, 1500])
if save == 'y'
saveas(gcf,[pwd,'\Plots\time_domain'],'epsc');
end 
