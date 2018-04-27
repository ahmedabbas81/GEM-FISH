function test_high_resolution_structure(out_dir_name, tads_positions_filename, nTADs, a_coef, exponent_relation, fish_distances_file,hic_fish_structure,high_resolution_distances)
tad_positions = load(tads_positions_filename);
Data1 = csvread(fish_distances_file);
filename = sprintf('./%s/Information.txt',out_dir_name);
fid_stats = fopen(filename,'w');
    
Data1 = Data1*1000;
Data = Data1;


TAD_Est_Dist = zeros(nTADs, nTADs);
relative_error = zeros(nTADs, nTADs);
k1 = 1;
for i = 1 : nTADs
    i1 = i;
    startI = tad_positions(i1,1);
    endI = tad_positions(i1,2);
    midI = (startI+endI)/2;
    for j1 = 1 : nTADs
        j2 = j1;
        sj = tad_positions(j2,1);
        ej = tad_positions(j2,2);
        mid = (sj+ej)/2;
        g_dist = abs(mid - midI);
        TAD_Est_Dist(i1,j2) =1000* a_coef*(g_dist)^exponent_relation;
        if(Data(i1,j2) ~= 0 && g_dist ~= 0)
            spatial_distances(k1,1) = Data1(i1,j2);
            genomic_distances(k1,1) = g_dist;%/1E7;
            k1 = k1 + 1;
        end
    end
end
Data1 = csvread(fish_distances_file);
Data1 = Data1*1000;
Data = Data1;
hic_fish_global_structure = load(hic_fish_structure);
distances_hic_fish = squareform(pdist(hic_fish_global_structure(:,:)));

sum_re = 0;
sum_re_high_resolution = 0;
count_re = 0;
for i = 1 : size(Data,1)
    for j = 1 : size(Data,2)
        if(Data(i,j) ~= 0)
            relative_error(i,j) = abs(Data(i,j) - distances_hic_fish(i,j))/Data(i,j);
            relative_error_high_resolution(i,j) = abs(Data(i,j) - high_resolution_distances(i,j))/Data(i,j);
            sum_re = sum_re + relative_error(i,j);
            sum_re_high_resolution = sum_re_high_resolution + relative_error_high_resolution(i,j);
            count_re = count_re + 1;
            
        end
    end
end
filename = sprintf('%s/relative_errors.mat',out_dir_name);
save(filename,'relative_error_high_resolution');
norm_original = ones(nTADs, nTADs);
norm_hic_fish = ones(nTADs, nTADs);
norm_hic_fish_high_resolution = ones(nTADs,nTADs);
for i = 1 : nTADs
    for j = 1 : nTADs
        if(TAD_Est_Dist(i,j) ~= 0)
            norm_original(i,j) = Data(i,j)/TAD_Est_Dist(i,j);
            norm_hic_fish(i,j) = distances_hic_fish(i,j)/TAD_Est_Dist(i,j);
            norm_hic_fish_high_resolution(i,j) = high_resolution_distances(i,j)/TAD_Est_Dist(i,j);
        end
    end
end
f_name = sprintf('%s/normalized_distance_matrices.mat',out_dir_name);
save(f_name,'norm_original','norm_hic_fish','norm_hic_fish_high_resolution');
dir_name = out_dir_name;
file_name = 'compartments_correlation';
get_compartments(norm_original,norm_hic_fish_high_resolution,dir_name,file_name);


    

