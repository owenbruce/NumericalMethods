%assignment2 This code uses the Newton Raphson algorithm to calculate
%the root of a function given an intial value of x and a desired accuracy
%of ead.

tic;

i = 0;  %Initializing variables
x = 2;
ead = 0.01;

ea = 100; %Presetting ea to 100 to ensure that the loop runs at least once

while ea>ead  %If the error is higher than the desired error
    if funcd(x) == 0
        disp("Derivative equal to zero, loop broken")
        break;
    end
    xold = x;
    x = x - func(x)/funcd(x);   %Calculate next value of x
    ea = abs((x-xold)/x)*100;   %Calculate approximate error
    i = i + 1;
end

disp(["Xr = ", num2str(x)])
disp(["Iterations = ", num2str(i)])

toc;