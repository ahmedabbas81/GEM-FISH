function [SE_start1, SE_end1] = get_start_end_points(start_bp1,end_bp1,tads,chr_num_string,blocks)
starting_tad = -1;
ending_tad = -1;

for i = 1 : size(tads,1)
    if(start_bp1>tads(i,1) && start_bp1<tads(i,2))
        starting_tad = i;
        break;
    end
end

for i = 1 : size(tads,1)
    if(end_bp1>tads(i,1) && end_bp1<tads(i,2))
        ending_tad = i;
        break;
    end
end
if(starting_tad == -1 || ending_tad == -1)
    fprintf('\nThe required TAD is not in the model');
    return;
end
tad_start_point = 0;
for i = 1 : starting_tad-1
    tad_start_point = tad_start_point + blocks(i);
end
loci_file_start = sprintf('/home/ahmed/Rao_data/Rao_files_%s_5kb/loci_tad_%d_Rao_5kb.txt',chr_num_string,starting_tad-1);
loci = load(loci_file_start);
for i = 2 : size(loci,1)
    if(start_bp1 >= loci(i-1,1) && start_bp1 <= loci(i,1))
        start_point = i;
        break;
    end
end
SE_start1 = tad_start_point + start_point;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tad_end_point = 0;
for i = 1 : ending_tad-1
    tad_end_point = tad_end_point + blocks(i);
end
loci_file_end = sprintf('/home/ahmed/Rao_data/Rao_files_%s_5kb/loci_tad_%d_Rao_5kb.txt',chr_num_string,ending_tad-1);
loci = load(loci_file_end);
for i = 2 : size(loci,1)
    if(end_bp1 >= loci(i-1,1) && end_bp1 <= loci(i,1))
        end_point = i;
        break;
    end
end

SE_end1 = tad_end_point + end_point;