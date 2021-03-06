function plotDecisionBoundary(theta, X, y)

% plot data
plotData(X(:,2:3), y);
hold on

% linear decision boundary 
if size(X, 2) <= 3 

    % only need 2 points to define a line, so choose two endpoints
    plot_x = [min(X(:,2))-2,  max(X(:,2))+2];

    % calculate the decision boundary line
    plot_y = (-1 ./ theta(3)) .* (theta(2) .* plot_x + theta(1));

    plot(plot_x, plot_y, 'LineWidth', 2)
    legend('Admitted', 'Not admitted', 'Decision Boundary')
    axis([30, 100, 30, 100])

% nonlinear decision boundary 
else
    % grid range
    u = linspace(-1, 1.5, 50);
    v = linspace(-1, 1.5, 50);

    z = zeros(length(u), length(v));

    % evaluate z = theta.x over the grid
    for i = 1:length(u)
        for j = 1:length(v)
            z(i,j) = mapFeature(u(i), v(j))*theta;
        end
    end
    z = z'; % important to transpose z before calling contour
    
    contour(u, v, z, [0, 0], 'LineWidth', 2)
end
hold off

end
