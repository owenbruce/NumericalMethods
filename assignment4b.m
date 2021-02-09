tic;

trueval = 44.74180307;
n = 10000;
r = 3;

int = r/n;
vals = linspace(0,3,n);

 j = 1;

intTot = zeros(n-1,1);

if mod(n,2) == 0
    intTot(j)=int*(Q(vals(j))+Q(vals(j+1)))/2;
    j=j+1;
end

while j<n
    intTot(j)=int*2*(Q(vals(j))+4*Q(vals(j+1))+Q(vals(j+2)))/6;
    j=j+2;
end

integralsum = sum(intTot)

ea = (trueval-integralsum)

toc;