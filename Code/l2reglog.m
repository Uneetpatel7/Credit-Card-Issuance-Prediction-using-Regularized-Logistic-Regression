function l2reglog

% number of data points

N = 1000;
x1 = randn(N,1)+3;
x2 = randn(N,1)+4;

plot(x1, x2, 'r.', 'LineWidth', 2);

dist = (x1-3).^2+(x2-4).^2;
y = zeros(1000,1);
y(dist<=1) = 1;

scatter(x1, x2, 100, y);

data = [x1 x2];
label = y;
save('credittest.txt', 'data', 'label');

dlmwrite('credit.txt',[data label]);

