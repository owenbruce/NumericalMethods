tic;

R = (sqrt(5)-1)/2;  %Initializing given values
xl = 0;
xu = 2;
i = 0;


d = R*(xu-xl);   %Calculating initial values
x1 = xl + d;
x2 = xu - d;
xhold = 0;

f1 = TempAna(x1);    %Calculate initial function values
f2 = TempAna(x2);

fhold = 100;   %Initialize a storage value for the previous minimum

for n=1:1000   %Keep iterating while the error is above the desired error
    
    i=i+1;   %Keep track of iterations
    
    if(f1<f2)    %If the first function is larger than the second, we close the boundaries around that value
        
        fhold = f1;
        xhold = x1;
        xl = x2;
        x2 = x1;
        f2 = f1;
        d = R*(xu-xl);
        x1 = xl+d;
        f1 = TempAna(x1);
        
    else   %If the second function is larger than the first, we close the boundaries around that value
        
        fhold = f2;
        xhold = x2;
        xu = x1;
        x1 = x2;
        f1 = f2;
        d = R*(xu-xl);
        x2 = xu-d;
        f2 = TempAna(x2);
        
    end

end

minimumVal = fhold
minimumLoc = xhold
iterations = i

toc;