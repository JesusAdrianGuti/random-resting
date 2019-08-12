
% Calculating the total work necessary for multi-stage compression of CO2
% equation used to calculate work at every stage
% Ws(i) = ((mf * R * Tcomp * Z(i))/(M*nu)) * (K(i)/K(i-1)) * ( ((CR)^( K(i-1)/K(i)) ) - 1)


% ================ Input Variables ===================
% mass flow rate of gas 
  m = 5000; % (ton/day)
  mf = (1000/(24*3600)) * m; % convert to (kg/s)
% Pressure of Gas coming in (MPa)
  Pin = 0.1;
% Final Desired pressure (MPa)
  POut = 7.38;
% Number of compressor stages
  s = 5;
% Initial Temperature of gas (K)
  Tin = 313.15;
% Temperature of running compressor (K)
  Tcomp = 356;
% efficiency coefficient
  nu = 0.75;

% ========= Input Specific Properties of Gas ==========  
% Molecular weight of gas (kg/kmol)
  M = 44;
% Constant R (KJ/kmolK)	8.314
  R = 8.314;  
% Stage cutoff pressures (Mpa)
  Pcut = [0.1 ; 0.24; 0.56; 1.32; 3.12; 7.38];
% Calculate Compression Ratio
  CR = ( POut / Pin ) ^ (1/s);
% Specific heat ratio for number of stages 
  K =[ 1.2686, 1.2732, 1.2840, 1.3122, 1.3915];
% CO2 Coefficient of Compressibility
  Z = [ 0.9973, 0.9934, 0.9846, 0.9632, 0.9110];
 
  
% ========== Data Formula / Manipulation =============
% Work for first compression stage
 Ws(1) = ((mf * R * Tin * Z(1))/(M*nu)) * (K(1)/K(1)) * ( ((CR)^( K(1)/K(1)) ) - 1);
% Work for subsequent stages of compression  
for i = 2:s
    Ws(i) = ((mf * R * Tcomp * Z(i))/(M*nu)) * (K(i)/K(i-1)) * ( ((CR)^( K(i-1)/K(i)) ) - 1);
end

% ========== Display of Values of interest ============
TotalWork =0;
for n = 1:s
    TotalWork = TotalWork + Ws(n);
    n = n+1;
end

fprintf('\n The total work is %.0f kW \n\n', TotalWork); % Display total power
fprintf(' %.1f kW   ', Ws); % Display power required at each stage
fprintf('\n');
K          % Display K values(Cp/Cv) at each stage
Z          % Display compressibility factor at each stage