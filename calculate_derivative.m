function der = calculate_derivative(ydata, fish_distances, flag_cost,A)
n_points = size(ydata,1);
dim = size(ydata,2);
der = zeros(n_points, dim);

for i = 1 : size(fish_distances,1)%n_points
    for j = 1 : size(fish_distances,1)%n_points
        if(i == j || fish_distances(i,j) == 0)
            continue;
        end
        distance_norm = norm(ydata(i,:) - ydata(j,:));
        diff = ydata(i,:) - ydata(j,:);
        if(flag_cost == 1)
            factor = A(abs(i-j))*2*(distance_norm - fish_distances(i,j))/distance_norm;
            der(i,:) = der(i,:) + diff.*factor;
        else
            factor = A(abs(i-j))*(sign(distance_norm - fish_distances(i,j)))/distance_norm;
            der(i,:) = der(i,:) + diff.*factor;
        end
    end
end