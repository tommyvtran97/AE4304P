% figure(1)
% plot(t,y(:,3), 'b-');
% hold on
% plot(t_pd,y_pd(:,3));
% title('Step reponse phugoid motion with \Delta\delta_e = -0.005 [rad]')
% legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
% ylabel('\theta [rad]')
% xlabel('time [s]')
% grid on
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\Pitch_response'],'epsc');
% end
% 
% figure(2)
% plot(t,y(:,4), 'b-');
% hold on
% plot(t_pd,y_pd(:,4));
% title('Step reponse phugoid motion with \Delta\delta_e = -0.005 [rad]')
% legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
% ylabel('q [rad/s]')
% xlabel('time [s]')
% grid on
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\PitchRate_response'],'epsc');
% end 

figure(1)
subplot(121)
plot(t,y(:,3), 'b-');
hold on
plot(t_pd,y_pd(:,3));
set(gca,'FontSize',18)
legend('Pitch Damper OFF', 'Pitch Damper ON');
ylabel('$\theta$ [rad]','interpreter','latex','FontSize',25)
xlabel('time [s]','interpreter','latex','FontSize',25)
grid on
set(gcf, 'Position',  [0, 0, 1500, 500])

subplot(122)
plot(t,y(:,4), 'b-');
hold on
plot(t_pd,y_pd(:,4));
set(gca,'FontSize',18)
legend('Pitch Damper OFF', 'Pitch Damper ON');
ylabel('$\frac{q\bar{c}}{V}$ [rad]','interpreter','latex','FontSize',25)
xlabel('time [s]','interpreter','latex','FontSize',25)
grid on
set(gcf, 'Position',  [0, 0, 1500, 500])
if save == 'y'
saveas(gcf,[pwd,'\Plots\step_phugoid'],'epsc');
end 