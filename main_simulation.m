% MATLAB script to simulate the Tumor-Immune Interaction Model
% Based on the thesis: A Review of Modeling Immunotherapy of the Tumor Immune Interaction

clear all; close all; clc;

% --- Parameter Estimation (from Chapter 3, Table 3.1) ---
params.c  = 0.035;    % Tumor antigenicity (varied: 0 to 0.05) [cite: 134]
params.k2 = 0.03;     % Effector cell death rate [cite: 134]
params.p1 = 0.1245;   % Max rate of IL-2 stimulated proliferation [cite: 134]
params.g1 = 2e7;      % IL-2 saturation constant [cite: 134]
params.s1 = 0.0;      % External ACI input (Adoptive Cellular Immunotherapy) [cite: 135]

params.r2 = 0.18;     % Intrinsic tumor growth rate [cite: 134]
params.b  = 1e-9;      % Inverse tumor carrying capacity (1/b = 10^9) [cite: 134]
params.a  = 1.0;      % Tumor killing rate by immune cells [cite: 134]
params.g2 = 1e5;      % Saturation constant for tumor killing [cite: 134]

params.p2 = 5.0;      % IL-2 production rate [cite: 134]
params.g3 = 1e3;      % Saturation constant for IL-2 production [cite: 134]
params.k3 = 10.0;     % IL-2 decay rate [cite: 134]
params.s2 = 0.0;      % External IL-2 therapy input [cite: 135]

% --- Initial Conditions (E0, T0, IL0) ---
% Based on standard literature values used in the thesis
E0  = 3.2e5; 
T0  = 1e6; 
IL0 = 1e1;
y0 = [E0; T0; IL0];

% --- Time Span (Days) ---
tspan = [0 500]; % Simulate for 500 days [cite: 4]

% --- Solve the System ---
[t, y] = ode45(@(t, y) tumor_model(t, y, params), tspan, y0);

% --- Plotting Results (Similar to Figure 5.1) ---
figure;
subplot(3,1,1);
plot(t, y(:,1), 'b', 'LineWidth', 1.5); title('Effector Cells (E)'); grid on;
ylabel('Cells');

subplot(3,1,2);
plot(t, y(:,2), 'r', 'LineWidth', 1.5); title('Tumor Cells (T)'); grid on;
ylabel('Cells');

subplot(3,1,3);
plot(t, y(:,3), 'g', 'LineWidth', 1.5); title('IL-2 Concentration'); grid on;
ylabel('Units');
xlabel('Time (days)');
