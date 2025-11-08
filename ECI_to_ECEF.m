function [r_eb_e,v_eb_e,C_b_e] = ECI_to_ECEF(t,r_ib_i,v_ib_i,C_b_i)
%ECI_to_ECEF - Converts position, velocity, and attitude from ECI- to
%ECEF-frame referenced and resolved
%
%
% Inputs:
%   t             time (s)
%   r_ib_i        Cartesian position of body frame w.r.t. ECI frame, resolved
%                 along ECI-frame axes (m)
%   v_ib_i        velocity of body frame w.r.t. ECI frame, resolved along
%                 ECI-frame axes (m/s)
%   C_b_i         body-to-ECI-frame coordinate transformation matrix
%
% Outputs:
%   r_eb_e        Cartesian position of body frame w.r.t. ECEF frame, resolved
%                 along ECEF-frame axes (m)
%   v_eb_e        velocity of body frame w.r.t. ECEF frame, resolved along
%                 ECEF-frame axes (m/s)
%   C_b_e         body-to-ECEF-frame coordinate transformation matrix

% Parameters
omega_ie = 7.292115E-5;  % Earth rotation rate (rad/s)


% Begins

% Calculate ECI to ECEF coordinate transformation matrix 
C_i_e = [cos(omega_ie * t), sin(omega_ie * t), 0;...
        -sin(omega_ie * t), cos(omega_ie * t), 0;...
                         0,                 0, 1];

% Transform position
r_eb_e = C_i_e * r_ib_i;

% Transform velocity
v_eb_e = C_i_e * (v_ib_i - omega_ie * [-r_ib_i(2);r_ib_i(1);0]);

% Transform attitude
C_b_e = C_i_e * C_b_i;

end