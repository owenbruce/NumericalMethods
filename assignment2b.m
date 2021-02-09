tic;

A = [2 -6 -1; -3 -1 7; -8 1 -2];   %Initialize matrices
B = [-38; -34; -20];

n = 3;   %Set size of matrices

for k=1:(n-1)   %Partially pivot so that the largest value is at the top
    if abs(A(1+k,1)) > abs(A(1,1))
       C = A(1,:);
       D = B(1);
       A(1,:) = A(1+k,:);
       A(1+k,:) = C;
       B(1) = B(1+k);
       B(1+k) = D;
    end
end

for i=1:(n-1)   %Perform forwards elimination to simplify the matrix
    for j=(i+1):(n)
       B(j,1) = B(j,1)-B(i,1)*(A(j,i)/A(i,i));
       A(j,:) = A(j,:)-A(i,:)*(A(j,i)/A(i,i));
    end
end

A
B

x3 = B(3)/A(3,3)   %Solve for the x-values
x2 = (B(2)-A(2,3)*x3)/A(2,2)
x1 = (B(1)-A(1,2)*x2-A(1,3)*x3)/A(1,1)

toc;