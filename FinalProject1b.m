T0 = 20;
M = 200;
TInfinite = 20;
mDot = 0.1;
C = 4180;
hT = 10;
hCoil = 150;
AT = 2;
ACoil = 0.5;

[TimeSteps, T] = ode45(@(t,T) TempChange(mDot,C,M,hCoil,ACoil,hT,AT,TInfinite,TIn(t),T),[0 TotalTime], 20);

[f g] = fit(TimeSteps, T, "poly4");

TimeStepsExp = [0.0 0.5 1.5 2.5 3.5 6.0 8.5 11.0 12.0].*3600;
TExp = [20.5 21.0 22.5 30.0 33.5 47.5 53.0 45.0 37.5];

plot(TimeSteps,T, TimeStepsExp, TExp)
xlabel("Time(s)")
ylabel("Temperature(℃)")

E = M*C/43200*integrate(f,43200,0)