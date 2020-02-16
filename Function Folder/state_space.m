%===================================================================
%       This script is based on the cit2s.m file. 
%       The values for the aircraft flight condition, 
%       stability and control derivatives are adjust 
%       according to the provided values for the 
%       'Twin-Engine Jet Aircraft #2'. The output of 
%       this script contains the state space matrix of 
%       the aircraft. 
% 
% Written by: Tommy Tran (4449142)
%===================================================================


% This script is based on the cit2s.m file. The values for the aircraft
% flight condition, stability and control derivatives are adjust according
% to the provided values for the 'Twin-Engine Jet Aircraft #2'. 

function [aircraft, aircraft_ext, A, B, C, C_ext, D, D_ext, V] = state_space(sigma, Lg)
    %% AIRCRAFT FLIGHT CONDITION.
    V           = 46.0;
    W           = 32000;
    twmuc       = 106.04;
    KY2         = 0.7899;
    c           = 1.98;
    S           = 25.95;
    lh          = 4.85;
    xcg         = 0.236*c;

    sigmaug_V = sigma/V;
    sigmaag   = sigma/V;

    %% AIRCRAFT SYMMETRIC AERODYNAMIC DERIVATIVES : 
    CX0 = 0.0000;     CZ0   =-0.9800;     Cm0   =  0.0000;
    CXu =-0.2700;     CZu   =-1.9500;     Cmu   = -0.0400;
    CXa = 0.4500;     CZa   =-5.2300;     Cma   = -0.4400;
    CXfa= 0.0000;     CZfa  =-1.4300;     Cmfa  = -3.5500;
    CXq = 0.0000;     CZq   =-3.5100;     Cmq   = -5.2000;
    CXd = 0.0000;     CZd   =-0.3300;     Cmd   = -0.9900;
                      CZfug = 0.0000;     Cmfug = -Cm0*lh/c;
                      CZfag = CZfa-CZq;   Cmfag = Cmfa - Cmq;



    %% CALCULATION OF AIRCRAFT SYMMETRIC STABILITY DERIVATIVES
    xu   = (V/c)*(CXu/twmuc);
    xa   = (V/c)*(CXa/twmuc);
    xt   = (V/c)*(CZ0/twmuc);
    xq   = 0;
    xd   = (V/c)*(CXd/twmuc);
    xug  = xu;
    xfug = 0;
    xag  = xa;
    xfag = 0;

    zu   = (V/c)*( CZu/(twmuc-CZfa));
    za   = (V/c)*( CZa/(twmuc-CZfa));
    zt   = (V/c)*(-CX0/(twmuc-CZfa));
    zq   = (V/c)*((CZq+twmuc)/(twmuc-CZfa));
    zd   = (V/c)*( CZd/(twmuc-CZfa));
    zug  = zu;
    zfug = (V/c)*( CZfug/(twmuc-CZfa));
    zag  = za;
    zfag = (V/c)*( CZfag/(twmuc-CZfa));

    mu   = (V/c)*(( Cmu+CZu*Cmfa/(twmuc-CZfa))/(twmuc*KY2));
    ma   = (V/c)*(( Cma+CZa*Cmfa/(twmuc-CZfa))/(twmuc*KY2));
    mt   = (V/c)*((-CX0*Cmfa/(twmuc-CZfa))/(twmuc*KY2));
    mq   = (V/c)*(Cmq+Cmfa*(twmuc+CZq)/(twmuc-CZfa))/(twmuc*KY2);
    md   = (V/c)*((Cmd+CZd*Cmfa/(twmuc-CZfa))/(twmuc*KY2));
    mug  = mu;
    mfug = (V/c)*(Cmfug+CZfug*Cmfa/(twmuc-CZfa))/(twmuc*KY2);
    mag  = ma;
    mfag = (V/c)*(Cmfag+CZfag*Cmfa/(twmuc-CZfa))/(twmuc*KY2);

    %% STATE- AND INPUT MATRICES
    A=[xu xa xt 0    xug                  xag       0;
       zu za zt zq   zug-zfug*V/Lg*(c/V)  zag       zfag*(c/V);
       0  0  0  V/c  0                    0         0;
       mu ma mt mq   mug-mfug*V/Lg*(c/V)  mag       mfag*(c/V);
       0  0  0  0   -V/Lg                 0         0;
       0  0  0  0    0                    0         1;
       0  0  0  0    0                   -(V/Lg)^2 -2*V/Lg];

    B=...
     [xd 0                                 0;
      zd zfug*(c/V)*sigmaug_V*sqrt(2*V/Lg) zfag*(c/V)*sigmaag*sqrt(3*V/Lg);
      0  0                                 0;
      md mfug*(c/V)*sigmaug_V*sqrt(2*V/Lg) mfag*(c/V)*sigmaag*sqrt(3*V/Lg);
      0  sigmaug_V*sqrt(2*V/Lg)            0;
      0  0                                 sigmaag*sqrt(3*V/Lg);
      0  0                                 (1-2*sqrt(3))*sigmaag*sqrt((V/Lg)^3)];

    %% DEFINE THE OUTPUT MATRICES AND TAKE ALL STATES AS AN OUTPUT
    C = eye(size(A,1));
    D = zeros(size(B,1),size(B,2));

    %% CREATE A STATE SPACE REPRESENTATION OF THE MATRICES
    aircraft = ss(A,B,C,D);
    
    %% CREATE EXTENDED STATE SPACE REPRESENTATION WITH LOAD FACTOR
    g = 9.80665;
    Nz_C = V/g*(aircraft.A(3,:) - aircraft.A(2,:));
    Nz_D = [0 0 0];
    C_ext = [C; Nz_C];
    D_ext = [D; Nz_D];
    aircraft_ext = ss(A,B, C_ext, D_ext);
end 