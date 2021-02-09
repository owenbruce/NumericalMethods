clear; %Rest the command window, clear variables, and set format to long
clc;   
format long


n=100; %Set number of iterations
x=-10.0; %Set variable to be put in the exponential
%y=single(exp(x)); %Set the exponential to be tested against (single)
y=exp(x); %Set the exponential to be tested against
%sum=single(1.0); %Set the first term in the MacLaurin series (single)
sum=1.0; %Set the first term in the MacLaurin series

for i=2:n  %Iterate through the number of iterations desired
    term=x^(i-1)/factorial(i-1); %Set the current term to be the next term in the series
    %sum=sum+single(term); %Add the current term to the sum (single)
    sum=sum+term; %Add the current term to the sum 
    if abs((y-sum)/y)<eps %If the difference between the actual value and the approximation is less than machine epsilon, stop the loop
        break
    end
end

disp('number of terms=')  %Display the number of terms reached before the loop is broken
disp(i)
disp('true result =')  %Display the true result
disp(y)
disp('numerical result =')  %Display the numeric approximation
disp(sum)

