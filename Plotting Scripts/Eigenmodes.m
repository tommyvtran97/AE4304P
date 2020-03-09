%===================================================================
%       Generating eigenmodes plots
%===================================================================

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
ylabel('$\frac{q\bar{c}}{V}$ [rad]','interpreter','latex','FontSize',25)
xlabel('time [s]','interpreter','latex','FontSize',25)
grid on
set(gcf, 'Position',  [0, 0, 1500, 500])
if save == 'y'
saveas(gcf,[pwd,'\Plots\step_phugoid'],'epsc');
end 