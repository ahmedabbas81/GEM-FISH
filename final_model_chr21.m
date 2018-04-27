clear all
out_directory = 'Chr21_modeling_results'
mkdir(out_directory);
chr_num_string = '21';
ntads = 34;
% if the spatial distance vs. genomic distance relation is: s = a * g^b, where a and b are determined using the experimental FISH data for each individual chromosome 
a = 0.038;
b = 0.21;
% the resolution of the Hi-C maps used for intra-TAD conformations is 5 Kbps
resolution = 5E3;
% the relation between contact frequency and spatial distance: h = d^(hic_exp), derived from Hi-C data and FISH data 
hic_exp = -0.25;
get_high_res_and_test_Rao(chr_num_string,ntads,a,b,resolution,out_directory,hic_exp)

