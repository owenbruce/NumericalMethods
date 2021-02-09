function AnaTemp = TempAna(x)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
TLast = 100;
T0 = 200;
TInfinite = 20;
L = 2;
h = 100;
k = 400;
r = 0.1;
P = 2*pi*r;
Ac = pi*r^2;
m = sqrt(h*P/(k*Ac));

AnaTemp = ((((TLast-TInfinite)/(T0-TInfinite))*sinh(m*x)+sinh(m*(L-x)))/sinh(m*L))*(T0-TInfinite)+TInfinite;
end

