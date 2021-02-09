%First, we need to initialize our values
tic;
T0 = 20;
M = 200;
TInfinite = 20;
mDot = 0.1;
C = 4180;
hT = 10;
hCoil = 150;
AT = 2;
ACoil = 0.5;
Tin = 70;

%Next, we need to set up the number of times we will loop for h=1

TotalTime = 43200;
h1 = 1;
n = TotalTime/h1+1;   %Note that we add 1 here to include the inital condition

T_1 = zeros(n,1);
TimeSteps_1 = linspace(0,TotalTime,n);

T_1(1) = T0;

i = 2;

while i<=n
   T_1(i) = T_1(i-1)+h1*(TempChange(mDot,C,M,hCoil,ACoil,hT,AT,TInfinite,Tin,T_1(i-1)));
   i = i+1;
end

%Now, we need to repeat for h=300 and h=3600

h2 = 300;
n = TotalTime/h2+1;   %Note that we add 1 here to include the inital condition

T_2 = zeros(n,1);
TimeSteps_2 = linspace(0,TotalTime,n);

T_2(1) = T0;

i = 2;

while i<=n
   T_2(i) = T_2(i-1)+h2*(TempChange(mDot,C,M,hCoil,ACoil,hT,AT,TInfinite,Tin,T_2(i-1)));
   i = i+1;
end

h3 = 3600;
n = TotalTime/h3+1;   %Note that we add 1 here to include the inital condition

T_3 = zeros(n,1);
TimeSteps_3 = linspace(0,TotalTime,n);

T_3(1) = T0;

i = 2;

while i<=n
   T_3(i) = T_3(i-1)+h3*(TempChange(mDot,C,M,hCoil,ACoil,hT,AT,TInfinite,Tin,T_3(i-1)));
   i = i+1;
end

[TimeSteps_4,T_4] = ode45(@(t,T) TempChange(mDot,C,M,hCoil,ACoil,hT,AT,TInfinite,Tin,T),[0 TotalTime], 20);

plot(TimeSteps_1,T_1,'r',TimeSteps_2,T_2,'g',TimeSteps_3,T_3,'b',TimeSteps_4,T_4,'y');
legend("Time Step = 1s", "Time Step = 300s", "Time Step = 3600s", "ode45")
xlabel("Time (s)")
ylabel("Temperature (℃)")

toc;

TSteady = fsolve(@(T) TempChange(mDot,C,M,hCoil,ACoil,hT,AT,TInfinite,Tin,T), 20)
