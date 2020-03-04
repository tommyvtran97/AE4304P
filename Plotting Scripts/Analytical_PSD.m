% figure(10)
% loglog(w, Sana_u(:,1), 'b-', w, Sana_c(:,1), '-', 'linewidth',1)
% axis(10.^[-2,2,-15,0])
% xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
% ylabel('$S_{uu}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25); 
% title('Analytical power spectral density');
% legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
% grid on
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\psd_analytical_Suu'],'epsc');
% end
% 
% figure(11)
% loglog(w, Sana_u(:,2), 'b-', w, Sana_c(:,2), '-', 'linewidth',1)
% axis(10.^[-2,2,-15,0])
% xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
% ylabel('$S_{\alpha\alpha}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25); 
% title('Analytical power spectral density');
% legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
% grid on
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\psd_analytical_Saa'],'epsc');
% end
% 
% figure(12)
% loglog(w, Sana_u(:,3), 'b-', w, Sana_c(:,3), '-', 'linewidth',1)
% axis(10.^[-2,2,-15,0])
% xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25);
% ylabel('$S_{\theta\theta}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25); 
% title('Analytical power spectral density');
% legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
% grid on
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\psd_analytical_Stt'],'epsc');
% end
% 
% figure(13)
% loglog(w, Sana_u(:,4), 'b-', w, Sana_c(:,4), '-', 'linewidth',1)
% axis(10.^[-2,2,-15,0])
% xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
% ylabel('$S_{qq}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25); 
% title('Analytical power spectral density');
% legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
% grid on
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\psd_analytical_Sqq'],'epsc');
% end
% 
% figure(14)
% loglog(w, Sana_u(:,5), 'b-', w, Sana_c(:,5), '-', 'linewidth',1)
% axis(10.^[-2,2,-15,0])
% xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25);
% ylabel('$S_{n_zn_z}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25); 
% title('Analytical power spectral density');
% legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
% grid on
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\psd_analytical_Snznz'],'epsc');
% end

figure(4)
subplot(321)
loglog(w, Sana_u(:,1), 'b-', w, Sana_c(:,1), '-', 'linewidth',1)
axis(10.^[-2,2,-15,0])
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex', 'FontSize', 25); 
ylabel('$S_{uu}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex', 'FontSize', 25); 
%title('Analytical power spectral density');
legend('Pitch Damper OFF', 'Pitch Damper ON');
grid on
set(gcf, 'Position',  [0, 0, 1500, 1500])

subplot(322)
loglog(w, Sana_u(:,2), 'b-', w, Sana_c(:,2), '-', 'linewidth',1)
axis(10.^[-2,2,-15,0])
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex', 'FontSize', 25); 
ylabel('$S_{\alpha\alpha}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex', 'FontSize', 25); 
%title('Analytical power spectral density');
%legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
grid on
set(gcf, 'Position',  [0, 0, 1500, 1500])

subplot(323)
loglog(w, Sana_u(:,3), 'b-', w, Sana_c(:,3), '-', 'linewidth',1)
axis(10.^[-2,2,-15,0])
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex', 'FontSize', 25);
ylabel('$S_{\theta\theta}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex', 'FontSize', 25); 
%title('Analytical power spectral density');
%legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
grid on
set(gcf, 'Position',  [0, 0, 1500, 1500])

subplot(324)
loglog(w, Sana_u(:,4), 'b-', w, Sana_c(:,4), '-', 'linewidth',1)
axis(10.^[-2,2,-15,0])
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex', 'FontSize', 25); 
ylabel('$S_{qq}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex', 'FontSize', 25); 
%title('Analytical power spectral density');
%legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
grid on
set(gcf, 'Position',  [0, 0, 1500, 1500])

subplot(325)
loglog(w, Sana_u(:,5), 'b-', w, Sana_c(:,5), '-', 'linewidth',1)
axis(10.^[-2,2,-15,0])
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex', 'FontSize', 25);
ylabel('$S_{n_zn_z}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex', 'FontSize', 25); 
%title('Analytical power spectral density');
%legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
grid on
set(gcf, 'Position',  [0, 0, 1500, 1500])
if save == 'y'
saveas(gcf,[pwd,'\Plots\analytical_psd'],'epsc');
end