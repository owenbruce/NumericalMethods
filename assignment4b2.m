n = [5 10 100 500 1000 5000 10000];
ln = log(n);

results = [12.884661793652921 6.187494141295943 0.561520443919896 0.106904869435716 0.052500446823082 0.010134807605617 0.005002673130292];
lresults = log(results);

comptime = [0.000882 0.001352 0.003200 0.008079 0.003933 0.005638 0.006225];

yyaxis left
plot(ln,lresults)
xlabel('ln(n)')
ylabel('ln(absolute error)')

yyaxis right
plot(ln,comptime)
ylabel('comptime')
title('Error and Computation Time vs ln(n)')