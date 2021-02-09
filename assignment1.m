function [outputArg1,outputArg2] = assignment1(a,x)  %Input a and x to the function
%Assignment1 This function trys to find the square root of a by using the
%divide and average method.
%   Detailed explanation goes here

tic

i = 0; %Sets up iterations to take

if x==0 %If x = 0, the function will not fun and output an error to avoid dividing by zero
    disp("Error: Cannot divide by zero.")
else
    while round(sqrt(a),6,'significant') ~= round(x,6,'significant') %Continues code until the code is accurate to six significant digits
        x = (x+a/x)/2; %Executes divide and average method
        i = i+1; %Adds 1 to the number of iterations
    end
    disp(['Result of divide and average method: ', num2str(x,16)]) %Displays the result of the divide and average method
    disp(['Actual root of a: ', num2str(sqrt(a),16)]) %Displays the actual number for comparison
    
end
disp(['Number of iterations: ', num2str(i)]) %Displays the number of iterations

toc %Displays computation time
end

