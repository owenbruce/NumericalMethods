function TempPos = TempCalc(TempPrev,TempNext,DeltaX)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
TInfinite = 20;
h = 100;
k = 400;
L = 2;
r = 0.1;
P = 2*pi*r;
Ac = pi*r^2;

TempPos = (TempPrev/DeltaX^2+TempNext/DeltaX^2+h*P/(k*Ac)*TInfinite)/(h*P/(k*Ac)+2/DeltaX^2);
end

