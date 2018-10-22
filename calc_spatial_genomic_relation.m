function [a, b] = calc_spatial_genomic_relation(D,tads)
k1 = 1;
nTADs = size(tads,1);
for i = 1 : size(tads,1)
    startI = tads(i,1);
    endI = tads(i,2);
    midI = (startI+endI)/2;
    for j2 = 1 : nTADs
        if(j2 == i)
            continue;
        end
        sj = tads(j2,1);
        ej = tads(j2,2);
        mid = (sj+ej)/2;
        g_dist(k1) = log10(abs(mid - midI));
        s_dist(k1) = log10(D(i,j2));
        k1 = k1 + 1;
     end
end
p = polyfit(g_dist,s_dist,1);
a = 10^p(2);
b = p(1);
