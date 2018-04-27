function der = calculate_derivative_high_resolution(y_start, y_end, d_prior)
n_points = size(y_start,1);
dim = size(y_start,2);

for i = 1 : n_points
    distance_norm = norm(y_start(i,:) - y_end(i,:));
    factor = 2*(distance_norm - d_prior(i))/distance_norm;
    diff = y_start(i,:) - y_end(i,:);
    der(i,:) = diff.*factor;
end