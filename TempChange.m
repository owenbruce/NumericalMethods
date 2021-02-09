function dTdt = TempChange(mdot,C,M,hCoil,ACoil,hT,AT,TInfinite,Tin,T)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
dTdt = (mdot*C*(Tin-(Tin*(2*mdot*C-hCoil*ACoil)+2*hCoil*ACoil*T)/(hCoil*ACoil+2*mdot*C))-hT*AT*(T-TInfinite))/(M*C);
end

