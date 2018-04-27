function calculate_avg_fish_distances(coordinates_filename, n_tads, n_cells, flag_total, out_fname)
coordinates = xlsread(coordinates_filename);
if(flag_total ~= 1)
    Average_distances = zeros(n_tads*2, n_tads*2);
else
    Average_distances = zeros(n_tads, n_tads);
end
for i = 1 : n_cells
    for j = 1 : n_tads
        for k = 1 : n_tads
            if(flag_total ~= 1)
                j1 = 2*j-1;
                k1 = 2*k-1;
            else
                j1 = j;
                k1 = k;
            end
            if(isnan(coordinates((i-1)*n_tads +j, 3)) || isnan(coordinates((i-1)*n_tads +k, 3)))
                spatial_distances(i, j1, k1) = -10;
                continue;
            end
            if(j == k)
                spatial_distances(i, j1, k1) = 0;
                continue;
            end
            x1 = coordinates((i-1)*n_tads +j, 3);
            y1 = coordinates((i-1)*n_tads +j, 4);
            z1 = coordinates((i-1)*n_tads +j, 5);
            
            x2 = coordinates((i-1)*n_tads +k, 3);
            y2 = coordinates((i-1)*n_tads +k, 4);
            z2 = coordinates((i-1)*n_tads +k, 5);
            
            d = sqrt((x1 - x2)^2 + (y1 - y2)^2 + (z1 - z2)^2);
            
            spatial_distances(i, j1, k1) = d;%*1000;
        end
    end
end

for j = 1 : n_tads
    for k = 1 : n_tads
        if(flag_total ~= 1)
            j1 = 2*j-1;
            k1 = 2*k-1;
        else
            j1 = j;
            k1 = k;
        end
        if(j == k)
            Average_distances(j1, k1) = 0;
            continue;
        end
        sum = 0;
        n_distances = 0;
        count = 1;
        for i = 1 :n_cells
            if(spatial_distances(i, j1, k1) == -10)
                continue;
            end
            sum = sum + spatial_distances(i, j1, k1);
            n_distances = n_distances + 1;
        end
        sum = sum/n_distances;
        Average_distances(j1, k1) = sum;
    end
end
csvwrite(out_fname,Average_distances);
