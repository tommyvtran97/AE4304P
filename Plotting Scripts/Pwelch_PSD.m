figure(20)
loglog(w_p, Spw_u(:,1),w_p, Spw_c(:,1),'linewidth',1);
axis(10.^[-2,2,-15,0]);
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
ylabel('$S_{uu}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25); 
title('Pwelch power spectral density');
legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
grid on
set(gcf, 'Position',  [0, 0, 1100, 600])
if save == 'y'
saveas(gcf,[pwd,'\Plots\psd_pwelch_Suu'],'epsc');
end

figure(21)
loglog(w_p, Spw_u(:,2),w_p, Spw_c(:,2),'linewidth',1);
axis(10.^[-2,2,-15,0]);
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
ylabel('$S_{\alpha\alpha}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25); 
title('Pwelch power spectral density');
legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
grid on
set(gcf, 'Position',  [0, 0, 1100, 600])
if save == 'y'
saveas(gcf,[pwd,'\Plots\psd_pwelch_Saa'],'epsc');
end

figure(22)
loglog(w_p, Spw_u(:,3),w_p, Spw_c(:,3),'linewidth',1);
axis(10.^[-2,2,-15,0]);
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25);
ylabel('$S_{\theta\theta}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25); 
title('Pwelch power spectral density');
legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
grid on
set(gcf, 'Position',  [0, 0, 1100, 600])
if save == 'y'
saveas(gcf,[pwd,'\Plots\psd_pwelch_Stt'],'epsc');
end

figure(23)
loglog(w_p, Spw_u(:,4),w_p, Spw_c(:,4),'linewidth',1);
axis(10.^[-2,2,-15,0]);
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
ylabel('$S_{qq}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25); 
title('Pwelch power spectral density');
legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
grid on
set(gcf, 'Position',  [0, 0, 1100, 600])
if save == 'y'
saveas(gcf,[pwd,'\Plots\psd_pwelch_Sqq'],'epsc');
end

figure(24)
loglog(w_p, Spw_u(:,5),w_p, Spw_c(:,5),'linewidth',1);
axis(10.^[-2,2,-15,0]);
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25);
ylabel('$S_{n_zn_z}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25); 
title('Pwelch power spectral density');
legend('Pitch Damper OFF', 'Pitch Damper ON','FontSize', 15);
grid on
set(gcf, 'Position',  [0, 0, 1100, 600])
if save == 'y'
saveas(gcf,[pwd,'\Plots\psd_pwelch_Snznz'],'epsc');
end