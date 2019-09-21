function risk = computeRisk(m,y,h)
%COMPUTERISK Summary of this function goes here
%   Detailed explanation goes here

yT = y.';
risk1 = yT*log(h);
risk2 = (yT-1)*log(1-h);
risk = risk2-risk1;
risk = (1/m)*(risk);
end

