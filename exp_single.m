clear;
clc;
format long

n=100;
x=single(-10.0);
y=single(exp(x));
sum=single(1.0);

for i=2:n
    term=x^(i-1)/factorial(i-1);
    sum=sum+term;
    if abs((y-sum)/y)<eps
        break
    end
end

disp('number of terms=')
disp(i)
disp('true result =')
disp(y)
disp('numerical result =')
disp(sum)
