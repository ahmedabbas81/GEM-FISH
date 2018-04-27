function [estimated_dist, fitvalues] = get_exp(Data,start_ind,end_ind,nTADs,tad_positions)
k1 = 1;
row = 1;
for i = start_ind : end_ind
    i1 = i;
    startI = tad_positions(i1,1);
    endI = tad_positions(i1,2);
    midI = (startI+endI)/2;
    col = 1;
    for j1 = start_ind : end_ind
        j2 = j1;
        sj = tad_positions(j2,1);
        ej = tad_positions(j2,2);
        mid = (sj+ej)/2;
        g_dist = abs(mid - midI);
        
        if(Data(i1,j2) ~= 0 && g_dist ~= 0)
            spatial_distances(k1,1) = log10(Data(i1,j2));
            genomic_distances(k1,1) = log10(g_dist);
            k1 = k1 + 1;
        end
        col = col + 1;
    end
    row = row + 1;
end

[fun,goff]=fit(genomic_distances,spatial_distances,'poly1');
fitvalues=coeffvalues(fun);
fit_value = fitvalues(2);

row = 1;
for i = start_ind : end_ind
    i1 = i;
    startI = tad_positions(i1,1);
    endI = tad_positions(i1,2);
    midI = (startI+endI)/2;
    col = 1;
    for j1 = start_ind : end_ind
        j2 = j1;
        sj = tad_positions(j2,1);
        ej = tad_positions(j2,2);
        mid = (sj+ej)/2;
        g_dist = abs(mid - midI);
        estimated_dist(row,col) = (10^fitvalues(2))*(g_dist)^fitvalues(1);
        col = col + 1;
    end
    row = row + 1;
end