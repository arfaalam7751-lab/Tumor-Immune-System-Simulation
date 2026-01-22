# Modeling Immunotherapy of the Tumor-Immune Interaction

This repository contains the MATLAB implementation of the research conducted for my BS Mathematics thesis. 

## Project Overview
The project explores a system of three non-linear Ordinary Differential Equations (ODEs) that simulate the dynamics between:
1. **Effector Cells (E)** - The immune response.
2. **Tumor Cells (T)** - The cancerous growth.
3. **Interleukin-2 (IL-2)** - The signaling cytokine.

## Key Features
- **Numerical Simulation:** Uses `ode45` to solve the dynamics over a 500-day period.
- **Stability Analysis:** Code is structured to allow testing of different 'antigenicity' (c) values.
- **Therapy Testing:** Includes parameters for Adoptive Cellular Immunotherapy (ACI) and IL-2 injections.

## How to Run
1. Open `main_simulation.m` in MATLAB.
2. Ensure `tumor_model.m` is in the same folder.
3. Run the script to generate the growth and clearance graphs.# Tumor-Immune-System-Simulation
MATLAB implementation of a non-linear ODE model for Tumor-Immune interaction and Immunotherapy
