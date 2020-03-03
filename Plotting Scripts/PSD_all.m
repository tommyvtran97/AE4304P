% figure(25)
% subplot(211)
% loglog(omega, Sfft_u(:,1),w_p, Spw_u(:,1), w, Sana_u(:,1),'linewidth',1);
% axis(10.^[-2,2,-15,0]);
% xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
% ylabel('$S_{uu}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25);  
% title('Power spectral density without pitch damper');
% legend('FFT', 'Pwelch','Analytical','FontSize', 15);
% grid on
% subplot(212)
% loglog(omega, Sfft_c(:,1),w_p, Spw_c(:,1), w, Sana_c(:,1),'linewidth',1);
% axis(10.^[-2,2,-15,0]); 
% xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
% ylabel('$S_{uu}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25);  
% title('Power spectral density with pitch damper');
% grid on
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\psd_all_Suu'],'epsc');
% end
% 
% figure(26)
% subplot(211)
% loglog(omega, Sfft_u(:,2),w_p, Spw_u(:,2), w, Sana_u(:,2),'linewidth',1);
% axis(10.^[-2,2,-15,0]);
% xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
% ylabel('$S_{\alpha\alpha}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25);
% title('Power spectral density without pitch damper');
% legend('FFT', 'Pwelch','Analytical','FontSize', 15);
% grid on
% subplot(212)
% loglog(omega, Sfft_c(:,2),w_p, Spw_c(:,2), w, Sana_c(:,2),'linewidth',1);
% axis(10.^[-2,2,-15,0]);
% xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
% ylabel('$S_{\alpha\alpha}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25);
% title('Power spectral density with pitch damper');
% grid on
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\psd_all_Saa'],'epsc');
% end
% 
% figure(27)
% subplot(211)
% loglog(omega, Sfft_u(:,3),w_p, Spw_u(:,3), w, Sana_u(:,3),'linewidth',1);
% axis(10.^[-2,2,-15,0]);
% xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25);
% ylabel('$S_{\theta\theta}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25);
% title('Power spectral density without pitch damper');
% legend('FFT', 'Pwelch','Analytical','FontSize', 15);
% grid on
% subplot(212)
% loglog(omega, Sfft_c(:,3),w_p, Spw_c(:,3), w, Sana_c(:,3),'linewidth',1);
% axis(10.^[-2,2,-15,0]);
% xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25);
% ylabel('$S_{\theta\theta}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25);
% title('Power spectral density with pitch damper');
% grid on
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\psd_all_Stt'],'epsc');
% end
% 
% figure(28)
% subplot(211)
% loglog(omega, Sfft_u(:,4),w_p, Spw_u(:,4), w, Sana_u(:,4),'linewidth',1);
% axis(10.^[-2,2,-15,0]);
% xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
% ylabel('$S_{qq}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25);  
% title('Power spectral density without pitch damper');
% legend('FFT', 'Pwelch','Analytical','FontSize', 15);
% grid on
% subplot(212)
% loglog(omega, Sfft_c(:,4),w_p, Spw_c(:,4), w, Sana_c(:,4),'linewidth',1);
% axis(10.^[-2,2,-15,0]);
% xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
% ylabel('$S_{qq}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25); 
% title('Power spectral density with pitch damper');
% grid on
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\psd_all_Sqq'],'epsc');
% end
% 
% figure(29)
% subplot(211)
% loglog(omega, Sfft_u(:,5),w_p, Spw_u(:,5), w, Sana_u(:,5),'linewidth',1);
% axis(10.^[-2,2,-15,0]);
% xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25);
% ylabel('$S_{n_zn_z}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25);
% title('Power spectral density without pitch damper');
% legend('FFT', 'Pwelch','Analytical','FontSize', 15);
% grid on
% subplot(212)
% loglog(omega,Sfft_c(:,5),w_p, Spw_c(:,5), w, Sana_c(:,5),'linewidth',1);
% axis(10.^[-2,2,-15,0]);
% xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25);
% ylabel('$S_{n_zn_z}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25); 
% title('Power spectral density with pitch damper');
% grid on
% set(gcf, 'Position',  [0, 0, 1100, 600])
% if save == 'y'
% saveas(gcf,[pwd,'\Plots\psd_all_Snznz'],'epsc');
% end

figure(25)
subplot(221)
loglog(omega, Sfft_u(:,1),w_p, Spw_u(:,1), w, Sana_u(:,1),'linewidth',1);
axis(10.^[-2,2,-15,0]);
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
ylabel('$S_{uu}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25);  
title('Power spectral density without pitch damper','FontSize', 14);
legend('FFT', 'Pwelch','Analytical');
grid on
subplot(223)
loglog(omega, Sfft_c(:,1),w_p, Spw_c(:,1), w, Sana_c(:,1),'linewidth',1);
axis(10.^[-2,2,-15,0]); 
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
ylabel('$S_{uu}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25);  
title('Power spectral density with pitch damper','FontSize', 14);
grid on
set(gcf, 'Position',  [0, 0, 1500, 1500])
if save == 'y'
saveas(gcf,[pwd,'\Plots\psd_all_Suu'],'epsc');
end

subplot(222)
loglog(omega, Sfft_u(:,2),w_p, Spw_u(:,2), w, Sana_u(:,2),'linewidth',1);
axis(10.^[-2,2,-15,0]);
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
ylabel('$S_{\alpha\alpha}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25);
title('Power spectral density without pitch damper','FontSize', 14);
%legend('FFT', 'Pwelch','Analytical');
grid on
subplot(224)
loglog(omega, Sfft_c(:,2),w_p, Spw_c(:,2), w, Sana_c(:,2),'linewidth',1);
axis(10.^[-2,2,-15,0]);
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
ylabel('$S_{\alpha\alpha}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25);
title('Power spectral density with pitch damper','FontSize', 14);
grid on
set(gcf, 'Position',  [0, 0, 1500, 1500])
if save == 'y'
saveas(gcf,[pwd,'\Plots\psd_all_Saa'],'epsc');
end

figure(27)
subplot(221)
loglog(omega, Sfft_u(:,3),w_p, Spw_u(:,3), w, Sana_u(:,3),'linewidth',1);
axis(10.^[-2,2,-15,0]);
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25);
ylabel('$S_{\theta\theta}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25);
title('Power spectral density without pitch damper','FontSize', 14);
legend('FFT', 'Pwelch','Analytical');
grid on
subplot(223)
loglog(omega, Sfft_c(:,3),w_p, Spw_c(:,3), w, Sana_c(:,3),'linewidth',1);
axis(10.^[-2,2,-15,0]);
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25);
ylabel('$S_{\theta\theta}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25);
title('Power spectral density with pitch damper','FontSize', 14);
grid on
set(gcf, 'Position',  [0, 0, 1500, 1500])
if save == 'y'
saveas(gcf,[pwd,'\Plots\psd_all_Stt'],'epsc');
end

subplot(222)
loglog(omega, Sfft_u(:,4),w_p, Spw_u(:,4), w, Sana_u(:,4),'linewidth',1);
axis(10.^[-2,2,-15,0]);
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
ylabel('$S_{qq}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25);  
title('Power spectral density without pitch damper','FontSize', 14);
%legend('FFT', 'Pwelch','Analytical');
grid on
subplot(224)
loglog(omega, Sfft_c(:,4),w_p, Spw_c(:,4), w, Sana_c(:,4),'linewidth',1);
axis(10.^[-2,2,-15,0]);
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25); 
ylabel('$S_{qq}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25); 
title('Power spectral density with pitch damper','FontSize', 14);
grid on
set(gcf, 'Position',  [0, 0, 1500, 1500])
if save == 'y'
saveas(gcf,[pwd,'\Plots\psd_all_Sqq'],'epsc');
end

figure(29)
subplot(211)
loglog(omega, Sfft_u(:,5),w_p, Spw_u(:,5), w, Sana_u(:,5),'linewidth',1);
axis(10.^[-2,2,-15,0]);
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25);
ylabel('$S_{n_zn_z}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25);
title('Power spectral density without pitch damper','FontSize', 14);
legend('FFT', 'Pwelch','Analytical');
grid on
subplot(212)
loglog(omega,Sfft_c(:,5),w_p, Spw_c(:,5), w, Sana_c(:,5),'linewidth',1);
axis(10.^[-2,2,-15,0]);
set(gca,'FontSize',18)
xlabel('$\omega$ [$\frac{rad}{s}$]','interpreter','latex','FontSize', 25);
ylabel('$S_{n_zn_z}$ [$\frac{rad^2}{rad/s}$]','interpreter','latex','FontSize', 25); 
title('Power spectral density with pitch damper','FontSize', 14);
grid on
set(gcf, 'Position',  [0, 0, 635, 1500])
if save == 'y'
saveas(gcf,[pwd,'\Plots\psd_all_Snznz'],'epsc');
end