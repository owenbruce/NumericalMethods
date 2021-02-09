tic;

i = 0;  %Initializing variables
x1 = 1;
x = 0.9;
ead = 0.001;

ea = 100; %Presetting ea to 100 to ensure that the loop runs at least once

while ea>ead  %If the error is higher than the desired error
    x2 = x1;
    x1 = x;
    x = x1 - ((TempAna(x1)-120)*(x1-x2))/((TempAna(x1)-120)-(TempAna(x2)-120));   %Calculate next value of x
    ea = abs((x-x1)/x)*100;   %Calculate approximate error
    i = i + 1;
end
format long
disp(x)
disp(i)

toc;