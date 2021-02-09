tic;

R = (sqrt(5)-1)/2;  %Initializing given values
xl = 0.5;
xu = 1.4;
em = 0.01;
et = 100;
i = 0;

tval = 11.31370850;   %Value calculated in Q3

d = R*(xu-xl);   %Calculating initial values
x1 = xl + d;
x2 = xu - d;

f1 = golden(x1);    %Calculate initial function values
f2 = golden(x2);

fhold = 100;   %Initialize a storage value for the previous minimum

while et>em   %Keep iterating while the error is above the desired error
    
    i=i+1;   %Keep track of iterations
    
    if(f1<f2)    %If the first function is larger than the second, we close the boundaries around that value
        
        fhold = f1;
        xl = x2;
        x2 = x1;
        f2 = f1;
        d = R*(xu-xl);
        x1 = xl+d;
        f1 = golden(x1);
        
    else   %If the second function is larger than the first, we close the boundaries around that value
        
        fhold = f2;
        xu = x1;
        x1 = x2;
        f1 = f2;
        d = R*(xu-xl);
        x2 = xu-d;
        f2 = golden(x2);
        
    end
    
    if fhold ~= 0   %Avoiding divide by zero
        
        et = abs((tval-fhold))/tval*100;
        
    else
        break;
    end
end

finalError = et   %display the final results
minimumVal = fhold
iterations = i

toc;