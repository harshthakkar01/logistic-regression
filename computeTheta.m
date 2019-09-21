function theta = computeTheta(h, Y, n, theta1, mx, XT)
%COMPUTETHETA Summary of this function goes here
%   Detailed explanation goes here

theta = theta1-(n/mx)*(XT*(h-Y));

end

