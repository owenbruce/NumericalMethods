T=[0;5;10;15;20];
P=[100;200;450;950;2000];

[f,gof] = fit(T,P,'exp1')

predval = f(25)

intvls = predint(f,25,0.95)

[flin, gof] = fit(T,P,'poly1')

predvallin = flin(25)

intvlslin = predint(flin,25,0.95)

plot(T,P,'o',T,f(T),T,flin(T))
title('Population Estimate vs Time')
xlabel('T(years)')
ylabel('Pop (#)')
legend('Data Points', 'Exponential Fit', 'Linear Fit')

figure
plot(T,(P-f(T)),T,(P-flin(T)))
title('Residual Population vs Time')
xlabel('T(years)')
ylabel('Residual Pop(#)')
legend('Exponential Residual','Linear Residual')