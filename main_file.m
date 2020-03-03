%===================================================================
%       This script contains the main code that
%       has been used in order to generate certain
%       plots that are related to the assignment AE4304P
% 
% Written by: Tommy Tran (4449142)
%===================================================================

clc;
clear;
addpath 'Function Folder';
addpath 'Plotting Scripts';

save = input('Save all images (Y/N): ','s');
all_plots = input('Show all Plots (Y/N): ', 's');
if all_plots == 'n'
    stability_plots = input('Show stability analysis (Y/N): ', 's');
    time_domain_plots = input('Show time domain analysis (Y/N): ', 's');
    analytical_plots = input('Show analytical PSD (Y/N): ', 's');
    fft_plots = input('Show FFT PSD (Y/N): ', 's');
    pwelch_plots = input('Show Pwelch PSD (Y/N): ','s');
    all_psd_plots = input('Show all PSD (Y/N): ', 's');
else
    stability_plots = 'y'; time_domain_plots = 'y'; analytical_plots = 'y';
    fft_plots = 'y'; pwelch_plots = 'y'; all_psd_plots = 'y';
end 


%% TURBULANCE PARAMETERS
sigma = 1;
Lg = 1500;

%% CREATE A STEP RESPONSE FOR THE PHUGOID EIGENGMODE
[aircraft, aircraft_ext, A, B, C, C_ext, D, D_ext, V] = state_space(sigma, Lg);

% GENERATE AN INPUT PULSE OF 10 SEC TO EXCITE PHUGOID MOTION
[de,t] = input_generator(0,150,-0.005,0,10);
[w1,t] = input_generator(0,150,-0.005,0,0);
[w3,t] = input_generator(0,150,-0.005,0,0);
u = [de(:),w1(:),w3(:)];
[y,t] = lsim(aircraft,u,t);

% DETERMINE THE CONTROLLABILITY MATRIX AND VERIFY FULL RANK
control = length(A) - rank(ctrb(A,B));

% DERIVE GAIN FOR THETA TO OBTAIN DAMPING RATIO 0.5
Kt = -0.13035;
K = [0 0 Kt 0 0 0 0];
A_pd = A-B(:,1)*K;
aircraft_pd = ss(A_pd, B, C, D);
[y_pd,t_pd] = lsim(aircraft_pd,u,t);

% PLOTTING RESULTS WITH GENERATED INPUTS
if stability_plots == 'y'
    Eigenmodes;
end 

[wn, zeta] = damp(tf(aircraft_pd(3,1)));
zeta = zeta(1);

%% STABILITY ANALYSIS EIGENMODES
disp(' ');
disp('*** Stability Analysis ***');
disp(' '); 

ac_eig = eig(aircraft);
acpd_eig = eig(aircraft_pd);

% PLOTTING THE POLES AND ZEROS OF SYSTEM WITH AND WITHOUT PITCH DAMPER
if stability_plots == 'y'
    PZMap;
end

% ANALYZE THE STABILITY OF THE AIRCRAFT BY EVALUATING REAL PART EIGENVALUES
if real(ac_eig) <=0
    disp('The aircraft without pitch damper is stable!')
else 
    disp('The aircraft wihout pitch damper is unstable!')
end

if real(acpd_eig) <=0
    disp('The aircraft without pitch damper is stable!')
else 
    disp('The aircraft without pitch damper is unstable!')
end

disp('[Done]');

%% TIME-DOMAIN ANALYSIS
disp(' ');
disp('*** Time Domain Analysis ***');
disp(' ');

% TIME AXIS INPUT VECTOR DEFINITION
dt = 0.05; fs = 1/dt;
T = 200; t = [0:dt:T]; N = length(t);

% INPUT VECTOR DEFINITION
rng('default');
rng(1);
wn = 1;                             % White noise intensity 1
nn = zeros(1,N);                    % zero input elevator             
w1 = randn(1,N)/sqrt(dt);           % scaled input hor. turbulence,
                                    % note the sqrt(dt) because of lsim
w3 = randn(1,N)/sqrt(dt);           % scaled input vert. turbulence,
                                    % note the sqrt(dt) because of lsim
u = [nn' nn' w3'];                  % input vector definition (vertical
                                    % turbulence only, can be changed).
                            
% SIMULATION OF MOTION VARIABLES
g = 9.80665;
Nzpd_C = V/g*(aircraft_pd.A(3,:) - aircraft_pd.A(2,:));
Nzpd_D = V/g*(aircraft.B(3,:) - aircraft.B(2,:));
Cpd_ext = [C; Nzpd_C];
Dpd_ext = [D; Nzpd_D];
aircraft_ext_pd = ss(A_pd, B, Cpd_ext, Dpd_ext);

y = lsim(aircraft_ext, u, t);
y_pd = lsim(aircraft_ext_pd, u, t);

% PLOTTING RESULTS
if time_domain_plots == 'y'
    Time_Domain;
end

disp('[Done]')

%% ANALYTICAL POWER SPECTRAL DENSTIY USING THE PREVIOUS INPUT DATASET
disp(' ');
disp('*** Analytical Spectral Analysis ***');
disp(' ');

% FREQUENCY AXIS
w = logspace(-2,2,N);

% COMPUTE FREQUENCY RESPONSE FUNCTION AND PSD
mag = bode(A,B,C_ext(1,:), D_ext(1,:),3,w); Suu_u = mag.*mag;
mag = bode(A,B,C_ext(2,:), D_ext(2,:),3,w); Saa_u = mag.*mag;
mag = bode(A,B,C_ext(3,:), D_ext(3,:),3,w); Stt_u = mag.*mag;
mag = bode(A,B,C_ext(4,:), D_ext(4,:),3,w); Sqq_u = mag.*mag;
mag = bode(A,B,C_ext(8,:), D_ext(8,:),3,w); Snznz_u = mag.*mag;

mag = bode(A_pd,B,C_ext(1,:), D_ext(1,:),3,w); Suu_c = mag.*mag;
mag = bode(A_pd,B,C_ext(2,:), D_ext(2,:),3,w); Saa_c = mag.*mag;
mag = bode(A_pd,B,C_ext(3,:), D_ext(3,:),3,w); Stt_c = mag.*mag;
mag = bode(A_pd,B,C_ext(4,:), D_ext(4,:),3,w); Sqq_c = mag.*mag;
mag = bode(A_pd,B,C_ext(8,:), D_ext(8,:),3,w); Snznz_c = mag.*mag;

Sana_u = [Suu_u, Saa_u, Stt_u, Sqq_u, Snznz_u];
Sana_c = [Suu_c, Saa_c, Stt_c, Sqq_c, Snznz_c];

% PLOTTING POWER SPECTRAL DENSITY ANALYTICAL
if analytical_plots == 'y'
    Analytical_PSD;
end 

disp('[Done]');

%% POWER SPECTRAL DENSITY USING FFT METHOD
disp(' ');
disp('*** FFT Spectral Analysis ***');
disp(' ');

% FFT ALL SIGNALS
U_u = dt*fft(y(:,1));         U_c = dt*fft(y_pd(:,1));
ALPHA_u = dt*fft(y(:,2));     ALPHA_c = dt*fft(y_pd(:,2));
THETA_u = dt*fft(y(:,3));     THETA_c = dt*fft(y_pd(:,3));
QCV_u = dt*fft(y(:,4));       QCV_c = dt*fft(y_pd(:,4));
NZ_u = dt*fft(y(:,8));        NZ_c = dt*fft(y_pd(:,8));

% COMPUTE PSD
Pu_u = real((1/T)*      U_u.*conj(U_u));            Pu_c = real((1/T)*      U_c.*conj(U_c));
Palpha_u = real((1/T)*  ALPHA_u.*conj(ALPHA_u));    Palpha_c = real((1/T)*  ALPHA_c.*conj(ALPHA_c));
Ptheta_u = real((1/T)*  THETA_u.*conj(THETA_u));    Ptheta_c = real((1/T)*  THETA_c.*conj(THETA_c));
PqcV_u = real((1/T)*    QCV_u.*conj(QCV_u));        PqcV_c = real((1/T)*    QCV_c.*conj(QCV_c));
Pnz_u = real((1/T)*     NZ_u.*conj(NZ_u));          Pnz_c = real((1/T)*     NZ_c.*conj(NZ_c));

Pu_u = Pu_u(1:round(N/2)-1);           Pu_c = Pu_c(1:round(N/2)-1);
Palpha_u = Palpha_u(1:round(N/2)-1);   Palpha_c = Palpha_c(1:round(N/2)-1);    
Ptheta_u = Ptheta_u(1:round(N/2)-1);   Ptheta_c = Ptheta_c(1:round(N/2)-1);
PqcV_u = PqcV_u(1:round(N/2)-1);       PqcV_c = PqcV_c(1:round(N/2)-1);
Pnz_u = Pnz_u(1:round(N/2)-1);         Pnz_c = Pnz_c(1:round(N/2)-1);

Sfft_u = [Pu_u, Palpha_u, Ptheta_u, PqcV_u, Pnz_u];
Sfft_c = [Pu_c, Palpha_c, Ptheta_c, PqcV_c, Pnz_c];

% DEFINE FREQUENCY VECTOR FOR PLOTTING
omega = 2*pi*fs*(0:(N/2)-1)/N;

if fft_plots == 'y'
    FFT_PSD;
end 

disp('[Done]');

%% POWER SPECTRAL ANALYSIS USING PWELCH
disp(' ');
disp('*** Pwelch Spectral Analysis ***');
disp(' ');

% SETTING PWELCH
fs = 1/dt;
window = [];
noverlap = [];

[Suu_u_p, f] = pwelch(y(:,1),window,noverlap,N,fs,'onesided'); Suu_u_p = Suu_u_p/2; Suu_u_p = Suu_u_p(2:round(N/2)-1);
[Saa_u_p, f] = pwelch(y(:,2),window,noverlap,N,fs,'onesided'); Saa_u_p = Saa_u_p/2; Saa_u_p = Saa_u_p(2:round(N/2)-1);
[Stt_u_p, f] = pwelch(y(:,3),window,noverlap,N,fs,'onesided'); Stt_u_p = Stt_u_p/2; Stt_u_p = Stt_u_p(2:round(N/2)-1);
[Sqq_u_p, f] = pwelch(y(:,4),window,noverlap,N,fs,'onesided'); Sqq_u_p = Sqq_u_p/2; Sqq_u_p = Sqq_u_p(2:round(N/2)-1);
[Snznz_u_p, f] = pwelch(y(:,8),window,noverlap,N,fs,'onesided'); Snznz_u_p = Snznz_u_p/2; Snznz_u_p = Snznz_u_p(2:round(N/2)-1);

[Suu_c_p, f] = pwelch(y_pd(:,1),window,noverlap,N,fs,'onesided'); Suu_c_p = Suu_c_p/2; Suu_c_p = Suu_c_p(2:round(N/2)-1);
[Saa_c_p, f] = pwelch(y_pd(:,2),window,noverlap,N,fs,'onesided'); Saa_c_p = Saa_c_p/2; Saa_c_p = Saa_c_p(2:round(N/2)-1);
[Stt_c_p, f] = pwelch(y_pd(:,3),window,noverlap,N,fs,'onesided'); Stt_c_p = Stt_c_p/2; Stt_c_p = Stt_c_p(2:round(N/2)-1);
[Sqq_c_p, f] = pwelch(y_pd(:,4),window,noverlap,N,fs,'onesided'); Sqq_c_p = Sqq_c_p/2; Sqq_c_p = Sqq_c_p(2:round(N/2)-1);
[Snznz_c_p, f] = pwelch(y_pd(:,8),window,noverlap,N,fs,'onesided'); Snznz_c_p = Snznz_c_p/2; Snznz_c_p = Snznz_c_p(2:round(N/2)-1);

Spw_u = [Suu_u_p, Saa_u_p, Stt_u_p, Sqq_u_p, Snznz_u_p];
Spw_c = [Suu_c_p, Saa_c_p, Stt_c_p, Sqq_c_p, Snznz_c_p];

f = f(2:round(N/2)-1);
w_p = 2*pi*f;

% PLOTTING PSD PWELCH
if pwelch_plots == 'y'
    Pwelch_PSD;
end

% PLOTTING ALL PSD TOGETHER FOR EVALUATON OF METHODS
if all_psd_plots == 'y'
    PSD_all;
end

disp('[Done]');

%% Variance Estimation Analytical Power Spectra
disp(' ');
disp('*** Numerical integration of Analytical PSD ***');
disp(' ');

% COMPUTE VARIANCE THROUGH CRUDE INTEGRATION OF PSD
var = zeros(1,5);
for j = 1:5
    for i=1:N-1
        var(j) = var(j) + (w(i+1)-w(i))*Sana_u(i,j);
    end
end

disp('   Pitch Damper OFF');
var = var/pi;
disp(['Variance of V is: ' num2str(var(1))])
disp(['Variance of alpha is: ' num2str(var(2))])
disp(['Variance of theta is: ' num2str(var(3))])
disp(['Variance of pitch rate is: ' num2str(var(4))])
disp(['Variance of load factor is: ' num2str(var(5))])

var = zeros(1,5);
for j = 1:5
    for i=1:N-1
        var(j) = var(j) + (w(i+1)-w(i))*Sana_c(i,j);
    end
end

disp('   Pitch Damper ON');
var = var/pi;
disp(['Variance of V is: ' num2str(var(1))])
disp(['Variance of alpha is: ' num2str(var(2))])
disp(['Variance of theta is: ' num2str(var(3))])
disp(['Variance of pitch rate is: ' num2str(var(4))])
disp(['Variance of load factor is: ' num2str(var(5))])
disp('[Done]');

%% VARIANCE ESTIMATION FFT POWER SPECTRA
disp(' ');
disp('*** Numerical integration of FFT PSD ***');
disp(' ');

% COMPUTE VARIANCE THROUGH CRUDE INTEGRATION OF PSD
var = zeros(1,5);
for j = 1:5
    for i=1:size(omega,2)-1
        var(j) = var(j) + (omega(i+1)-omega(i))*Sfft_u(i,j);
    end
end

disp('   Pitch Damper OFF');
var = var/pi;
disp(['Variance of V is: ' num2str(var(1))])
disp(['Variance of alpha is: ' num2str(var(2))])
disp(['Variance of theta is: ' num2str(var(3))])
disp(['Variance of pitch rate is: ' num2str(var(4))])
disp(['Variance of load factor is: ' num2str(var(5))])

var = zeros(1,5);
for j = 1:5
    for i=1:size(omega,2)-1
        var(j) = var(j) + (omega(i+1)-omega(i))*Sfft_c(i,j);
    end
end

disp('   Pitch Damper ON');
var = var/pi;
disp(['Variance of V is: ' num2str(var(1))])
disp(['Variance of alpha is: ' num2str(var(2))])
disp(['Variance of theta is: ' num2str(var(3))])
disp(['Variance of pitch rate is: ' num2str(var(4))])
disp(['Variance of load factor is: ' num2str(var(5))])
disp('[Done]');

%% VARIANCE ESTIMATION PWELCH POWER SPECTRA
disp(' ');
disp('*** Numerical integration of PWELCH PSD ***');
disp(' ');

% COMPUTE VARIANCE THROUGH CRUDE INTEGRATION OF PSD
var = zeros(1,5);
for j = 1:5
    for i=1:size(w_p,1)-1
        var(j) = var(j) + (w_p(i+1)-w_p(i))*Spw_u(i,j);
    end
end

disp('   Pitch Damper OFF');
var = var/pi;
disp(['Variance of V is: ' num2str(var(1))])
disp(['Variance of alpha is: ' num2str(var(2))])
disp(['Variance of theta is: ' num2str(var(3))])
disp(['Variance of pitch rate is: ' num2str(var(4))])
disp(['Variance of load factor is: ' num2str(var(5))])

var = zeros(1,5);
for j = 1:5
    for i=1:size(w_p,1)-1
        var(j) = var(j) + (w_p(i+1)-w_p(i))*Spw_c(i,j);
    end
end

disp('   Pitch Damper ON');
var = var/pi;
disp(['Variance of V is: ' num2str(var(1))])
disp(['Variance of alpha is: ' num2str(var(2))])
disp(['Variance of theta is: ' num2str(var(3))])
disp(['Variance of pitch rate is: ' num2str(var(4))])
disp(['Variance of load factor is: ' num2str(var(5))])
disp('[Done]');

%% VARIANCE ESTIMATION USING VAR.m
disp(' ');
disp('*** VARIANCE ESTIMATION USING Var.m ***');
disp(' ');

clear var;
var_1 = var(y);
disp('   Pitch Damper OFF');
disp(['Variance of V is: ' num2str(var_1(1))])
disp(['Variance of alpha is: ' num2str(var_1(2))])
disp(['Variance of theta is: ' num2str(var_1(3))])
disp(['Variance of pitch rate is: ' num2str(var_1(4))])
disp(['Variance of load factor is: ' num2str(var_1(8))])

clear var;
var_2 = var(y_pd);
disp('   Pitch Damper ON');
disp(['Variance of V is: ' num2str(var_2(1))])
disp(['Variance of alpha is: ' num2str(var_2(2))])
disp(['Variance of theta is: ' num2str(var_2(3))])
disp(['Variance of pitch rate is: ' num2str(var_2(4))])
disp(['Variance of load factor is: ' num2str(var_2(8))])
disp('[Done]');

disp('Press a key to close all windows')
pause
close all;