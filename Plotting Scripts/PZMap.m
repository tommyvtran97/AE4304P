%===================================================================
%       Generating poles and zeros plots
%===================================================================

figure(2)
plot(ac_eig(1:4),'rx','MarkerSize',14)
hold on
plot(acpd_eig(1:4),'bx','MarkerSize',14)
legend('Pitch Damper OFF', 'Pitch Damper ON')
xlabel('Real Axis (seconds^{-1})')
ylabel('Imaginary Axis (seconds^{-1})')
xlim([-2,1])
ylim([-1.5,1.5])
set(gca,'FontSize',15)
grid on
if save == 'y'
saveas(gcf,[pwd,'\Plots\pzmap'],'epsc');
end 

