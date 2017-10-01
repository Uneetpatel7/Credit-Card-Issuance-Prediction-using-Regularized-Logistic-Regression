function plotDecisionBoundary(theta, X, y, mean, stdev,degree,orx)

plotdata(orx(:,2:3), y);
hold on;
if size(X, 2) <= 3
    % Only need 2 points to define a line, so choose two endpoints
    plot_x = [min(X(:,2))-2,  max(X(:,2))+2];

    % Calculate the decision boundary line
    plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1));

    plot(plot_x, plot_y)
    
    % Legend, specific for the exercise
    legend('Yes', 'No', 'Decision Boundary')
   
else

    u = linspace(0, 10, 50);
    v = linspace(0, 10, 50);
    size(u)
    z = zeros(length(u), length(v));
  
    mat=featuretransform(X,degree);
    for i = 1:length(u)
        for j = 1:length(v)
            %Temp = mat(i+j,:);
            Temp = combination(u(i),v(j),degree);
            Temp=((Temp(2:end)-mean(2:end))./stdev(2:end));
            %Temp(2:end)=((Temp(2:end)-mean)./stdev);
            z(i,j) = Temp*theta(2:end,1);
        end
    end
    z
    z = z'; 

    contour(u,v,z,[0,0],'LineWidth',2)
    %contour((u-mean(1))/stdev(1), (v-mean(2))/stdev(2), z, [0, 0], 'LineWidth', 2);
     legend('Yes', 'No', 'Decision Boundary');
end
hold off

end

