%===================================================================
%       Generating time domain simulation plots
%===================================================================

figure(3)
subplot(321)
plot(t, y(:,1), 'b-', t, y_pd(:,1))
set(gca,'FontSize',18)
xlabel('time [s]','interpreter','latex','FontSize', 25); ylabel('$\frac{u}{V}$ [-]','interpreter','latex','FontSize', 25);
legend('Pitch Damper OFF', 'Pitch Damper ON', 'Fontsize', 15);
grid on; 

subplot(322)
plot(t, y(:,2), 'b-', t, y_pd(:,2))
set(gca,'FontSize',18)
xlabel('time [s]','interpreter','latex','FontSize', 25); ylabel('$\alpha$ [rad]','interpreter','latex','FontSize', 25);
grid on;

subplot(323)
plot(t, y(:,3), 'b-', t, y_pd(:,3))
set(gca,'FontSize',18)
xlabel('time [s]','interpreter','latex','FontSize', 25); ylabel('$\theta$ [rad]','interpreter','latex', 'FontSize', 25);
grid on;

subplot(324)
plot(t, y(:,4), 'b-', t, y_pd(:,4))
set(gca,'FontSize',18)
xlabel('time [s]','interpreter','latex','FontSize',25); test1 = ylabel('$\frac{q\bar{c}}{V}$ [rad]','interpreter','latex','FontSize', 25);
test1.Position(1) = test1.Position(1) + 6.3;
grid on;

subplot(325)
plot(t, y(:,8), 'b-', t, y_pd(:,8))
set(gca,'FontSize',18)
xlabel('time [s]','interpreter','latex','FontSize', 25); ylabel('$n_z$ [-]','interpreter','latex','FontSize', 25);
grid on;
set(gcf, 'Position',  [0, 0, 1500, 1500])
if save == 'y'
saveas(gcf,[pwd,'\Plots\time_domain'],'epsc');
end 
