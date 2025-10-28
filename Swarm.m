clear; clc; close all;
% ---- Parameters ----
N  = 50;
L  = 100;
DT = 0.1;
MAX_SPEED = 2;
BINDING_RADIUS = 10;     
t_now =0;
COHESION = 0.2;
SEPARATION = 0.1; 

% ---- Initialization ----
P = (2 * L) * rand(N, 2) - L; 
V = 2 * rand(N, 2) - 1; 

% Normalize initial velocities
speed_mag = sqrt(sum(V.^2, 2));
V_unit = V ./ speed_mag;
V = V_unit .* min(speed_mag, MAX_SPEED);

% ---- Graphics ----
h = plot(P(:, 1), P(:, 2), 'o', 'MarkerSize', 5, 'MarkerFaceColor', [0.2 0.8 1], 'MarkerEdgeColor', [0 0.5 1]);
set(gca, 'FontSize', 14);
set(gca, 'LineWidth', 2);
set(gca, 'Color', [0, 0, 0]);
set(gcf, 'Renderer', 'painters');
box on;
axis equal;
title(sprintf("Particles sim t= %.1f s", t_now));

% ---- Main loop ----
while true
    V_new = zeros(N, 2);
    t_now = t_now + DT;

    for i = 1:N
            R = P - P(i,:);
            R_wrapped = R;
            R_wrapped(R >  L) = R_wrapped(R >  L) - 2*L;
            R_wrapped(R < -L) = R_wrapped(R < -L) + 2*L;
            dist = sqrt(sum(R_wrapped.^2, 2));
            idx = find(dist > 0 & dist < BINDING_RADIUS);
            
            if isempty(idx)
                V_new(i,:) = 0; 
                continue; 
            end
            
           
           V_separation = sum(-R_wrapped(idx,:) ./ dist(idx).^2, 1) * SEPARATION;
    
        
            CoM = mean(P(i,:) + R_wrapped(idx,:), 1); 
            V_social = (CoM - P(i,:)) * COHESION;
            
      
            V_temp = V(i,:) + V_social + V_separation; 
          
            sp = norm(V_temp);
            if sp > MAX_SPEED
                V_temp = V_temp * (MAX_SPEED/sp);
            end
            
            V_new(i,:) = V_temp - V(i,:);
     end

    V = V + V_new;
    P = P + V * DT;

  
    P(P > L) = P(P > L) - 2 * L;
    P(P < -L) = P(P < -L) + 2 * L;

 
    set(h, 'XData', P(:, 1), 'YData', P(:, 2));
    xlim([-L, L]);
    ylim([-L, L]);
    title(sprintf("Particles sim t= %.1f s", t_now));

    drawnow limitrate; 
end
