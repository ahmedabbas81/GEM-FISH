function get_high_res_and_test_Rao(chr_num_string,ntads,a_coef,g_s_exp,resolution,out_dir_name,hic_exp)
mkdir(out_dir_name);
local_structures_path=sprintf('./GEM-FISH_TAD-conformations/chr%s_local_structures_Rao_5kb',chr_num_string);
inter_tads = load('inter_tads.txt');
tads_positions_path=sprintf('tads_chr%s_hg19.txt',chr_num_string);
fish_distances_file = sprintf('fish_distances_chr%s.csv',chr_num_string);

fish_distances = csvread(fish_distances_file);
fish_distances = 1000*fish_distances;
hic_fish_structure = sprintf('./GEM-FISH_TAD-level-resolution/chr_%s_TAD_level_resolution/conformation1.txt',chr_num_string);
[high_resolution_structure,distances_tads] = get_high_resolution_structure(hic_fish_structure,local_structures_path,ntads,inter_tads,resolution,tads_positions_path,a_coef,g_s_exp,out_dir_name,hic_exp,fish_distances);
test_high_resolution_structure(out_dir_name, tads_positions_path, ntads, a_coef,g_s_exp, fish_distances_file,hic_fish_structure,distances_tads);
filename = sprintf('%s/final_model_chr%s.txt',out_dir_name,chr_num_string);
csvwrite(filename,high_resolution_structure);
fprintf('\nThe final 3D model of Chr%s is written to %s\n', chr_num_string,filename);
