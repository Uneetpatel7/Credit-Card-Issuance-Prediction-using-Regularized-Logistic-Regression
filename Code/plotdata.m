function plotdata(nx, y)

pos = find(y == 1); 
neg = find(y == 0);

% Plot Examples
plot(nx(pos, 1), nx(pos, 2), 'k+','LineWidth', 1, 'MarkerSize', 6)
hold on;
plot(nx(neg, 1), nx(neg, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 6)
hold off;

end