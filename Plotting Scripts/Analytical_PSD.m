%===================================================================
%       Generating analytical PSD plots
%===================================================================

figure(4)
subplot(321)
loglog(w, Sana_u(:,1), 'b-', w, Sana_c(:,1), '-', 'linewidth',1)
axis(10.^[-2,2,-15,0])
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex', 'FontSize', 25); 
ylabel('$S_{\hat{u}\hat{u}}$ [$\frac{1}{rad/s}$]','interpreter','latex', 'FontSize', 25); 
legend('Pitch Damper OFF', 'Pitch Damper ON');
grid on
set(gcf, 'Position',  [0, 0, 1500, 1500])

subplot(322)
loglog(w, Sana_u(:,2), 'b-', w, Sana_c(:,2), '-', 'linewidth',1)
axis(10.^[-2,2,-15,0])
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex', 'FontSize', 25); 
ylabel('$S_{\alpha\alpha}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex', 'FontSize', 25); 
grid on
set(gcf, 'Position',  [0, 0, 1500, 1500])

subplot(323)
loglog(w, Sana_u(:,3), 'b-', w, Sana_c(:,3), '-', 'linewidth',1)
axis(10.^[-2,2,-15,0])
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex', 'FontSize', 25);
ylabel('$S_{\theta\theta}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex', 'FontSize', 25); 
grid on
set(gcf, 'Position',  [0, 0, 1500, 1500])

subplot(324)
loglog(w, Sana_u(:,4), 'b-', w, Sana_c(:,4), '-', 'linewidth',1)
axis(10.^[-2,2,-15,0])
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex', 'FontSize', 25); 
ylabel('$S_{\frac{q\bar{c}}{V}\frac{q\bar{c}}{V}}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex', 'FontSize', 25); 
grid on
set(gcf, 'Position',  [0, 0, 1500, 1500])

subplot(325)
loglog(w, Sana_u(:,5), 'b-', w, Sana_c(:,5), '-', 'linewidth',1)
axis(10.^[-2,2,-15,0])
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex', 'FontSize', 25);
ylabel('$S_{n_zn_z}$ [$\frac{1}{rad/s}$]','interpreter','latex', 'FontSize', 25); 
grid on
set(gcf, 'Position',  [0, 0, 1500, 1500])
if save == 'y'
saveas(gcf,[pwd,'\Plots\analytical_psd'],'epsc');
end