function plotboundary( x , y )

pos = find(y == 1); 
neg = find(y == 0);

plot(x(pos, 1), x(pos, 2),'r.','MarkerSize',15)
hold on
plot(x(neg, 1), x(neg, 2),'b.','MarkerSize',15)
ezpolar(@(x)1);ezpolar(@(x)2);
%axis equal
hold off


end

