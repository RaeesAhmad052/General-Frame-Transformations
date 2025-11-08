function eul = CTM_to_Euler(C)
%CTM_to_Euler - Converts a coordinate transformation matrix to the
%corresponding set of Euler angles%
%
%
% Inputs:
%   C       coordinate transformation matrix (CTM) describing transformation from
%           beta to alpha
%
% Outputs:
%   eul     Euler angles describing rotation from beta to alpha in the 
%           order roll, pitch, yaw(rad)


% Begins

% Calculate Euler angles
eul(1,1) = atan2(C(2,3),C(3,3));  % roll
eul(2,1) = - asin(C(1,3));        % pitch
eul(3,1) = atan2(C(1,2),C(1,1));  % yaw

end