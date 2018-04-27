function [high_resolution_structure,distances_tads] = get_high_resolution_structure(global_structure_path,local_structures_path,ntads,inter_tads,resolution,tad_positions_path,a_coef,g_s_exp,dir_name,hic_exp,fish_distances)
global_structure=load(global_structure_path);
tad_positions = load(tad_positions_path);
[d_prior]=build_reduced_matrix2(inter_tads,tad_positions,resolution,a_coef,g_s_exp,hic_exp);
%all_segments = zeros(ntads, 200, 3); %assuming that max number of blocks in any tad is 200
blocks = zeros(1,ntads);%%holds the number of blocks in every tad
for i = 1 : ntads
    folder_name = sprintf('%s/tad%d',local_structures_path,i);
    index = 1;
    filename = sprintf('%s/conformation%d.txt',folder_name,index);
    segment = load(filename);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    center_segment = [mean(segment(:,1)),mean(segment(:,2)),mean(segment(:,3))];
    P_first = segment(1,:);
    d = norm(center_segment - P_first);
    P_first_new = [center_segment(1),center_segment(2),center_segment(3)+d];
    v1 = P_first - center_segment;
    v2 = P_first_new - center_segment;
    [angle, axis_rotation] = find_angle_axis(v1, v2);
    rotated_segment = rotate_structure(segment,angle,axis_rotation,center_segment);
   
    all_segments(i,1:size(segment,1),:) = rotated_segment(:,:);
    blocks(i) = size(segment,1);
    clear segment rotated_segment
end
centers = calculate_centers(all_segments, blocks);

all_segments_translated = translate_segments(all_segments, global_structure, centers, blocks);
centers2 = calculate_centers(all_segments_translated, blocks); %%centers2 should be exactly equal to global structure
der_old = zeros(ntads-1,3);
alpha = 0.1;
max_iter=10000;%0;
results_file_name=sprintf('%s/results_building_high_res_structure.txt',dir_name);
k1 = 1;

[high_resolution_structure,distances_tads]=build_structure(centers2,all_segments_translated,blocks,d_prior,max_iter,alpha,ntads,results_file_name,dir_name);
f_name = sprintf('%s/structures_and_stats.mat',dir_name);
save(f_name,'global_structure','high_resolution_structure')
high_res_distances = squareform(pdist(high_resolution_structure(:,:)));
