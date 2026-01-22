function dydt = tumor_model(t, y, p)
    % State variables
    E  = y(1);  % Effector Cells
    T  = y(2);  % Tumor Cells
    IL = y(3);  % IL-2 Concentration

    % --- System of ODEs (Chapter 2, Equations 2.1 - 2.3) ---
    
    % 1. Effector Cell Dynamics [cite: 89]
    dE = p.c*T - p.k2*E + (p.p1*E*IL)/(p.g1 + IL) + p.s1;
    
    % 2. Tumor Cell Dynamics [cite: 92]
    dT = p.r2*(1 - p.b*T)*T - (p.a*E*T)/(p.g2 + T);
    
    % 3. IL-2 Dynamics [cite: 94]
    dIL = (p.p2*E*T)/(p.g3 + T) - p.k3*IL + p.s2;

    dydt = [dE; dT; dIL];
end
