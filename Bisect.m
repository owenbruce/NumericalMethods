function y=Bisect(xl,xu,es,imax)

%initialization section
%********************** 
iter(1)=1;
fl=golden(xl);
ea=1.0;
xrold=xl;
i=1;
xr(1)=1;

%Iterations for root finding
%***************************
while ea>es  
    xr(i)=(xl+xu)/2;
    fr=golden(xr(i));
    if xr(i) ~= 0 
        ea=abs((xr(i)-xrold)/xr(i));
    else
        disp('Error: xr=0');
    end
    test=fl*fr;
    if test>0
        xu=xr(i);
    elseif test<0
        xl=xr(i);
        fl=fr;
    else
        ea=0;
    end
    xrold=xr(i);
    i=i+1;
    iter(i)=iter(i-1)+1;
    if iter(i)>=imax, break
    end
end   

%output the results
%******************

root=xr';
iter1=iter(1:end-1)';

y=[iter1,root];

end
    