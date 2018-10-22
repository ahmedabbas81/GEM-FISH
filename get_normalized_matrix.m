function N = get_normalized_matrix(tads,a,b)
%tads: the array of tad positions
% the relation is S = a G^b where S is the spatial distance in micro meter
% and G is the genomic distance

for i = 1 : size(tads,1)
    p1 = mean(tads(i,1:2));
    for j = 1 : size(tads,1)
        p2 = mean(tads(j,1:2));
        if(i == j)
            N(i,j) = 0;
        else
            N(i,j) = a*(abs(p2-p1)^b);
        end
    end
end