%First, initialize the temperatures
L = 2;
DeltaX = 0.05;
Nodes = linspace(0,L,L/DeltaX+1);
Temp = zeros(L/DeltaX+1,1);

for i= 1:length(Temp)
   Temp(i)=20; 
end

Temp(1) = 200;
Temp(end) = 100;

for n=1:2000
    for i=2:(length(Temp)-1)
        Temp(i) = TempCalc(Temp(i-1),Temp(i+1),DeltaX);
    end
end

TempAnalytical = zeros(L/DeltaX+1,1);

TempAnalytical(1) = 200;
TempAnalytical(end) = 100;


for i=2:(length(TempAnalytical)-1)
    TempAnalytical(i) = TempAna((i-1)*DeltaX);
end

disp(min(Temp))
disp((find(Temp==min(Temp))-1)*DeltaX)

plot(Nodes,Temp,'r',Nodes,TempAnalytical,'g')
legend("Numerical Approximation", "Analytical Values")
xlabel("Position (m)")
ylabel("Temperature (℃)")

figure

plot(Nodes, Temp-TempAnalytical)
xlabel("Position (m)")
ylabel("Temperature (℃)")
