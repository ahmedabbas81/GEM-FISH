function [exp_corr, hic_fish_corr,hic_corr] = get_compartments(original,hic_fish,out_dir_name,file_name,high_resolution_distances)
for i = 1 : size(original,1)
    for j = 1 : size(original,2)
        X = original(:,i);
        X1 = exclude_elements(X,i,j);
        X = original(:,j);
        X2 = exclude_elements(X,i,j);
        
        R = corrcoef(X1,X2);
        exp_corr(i,j) = R(1,2);
        clear X1 X2
        X = hic_fish(:,i);
        X1 = exclude_elements(X,i,j);
        X = hic_fish(:,j);
        X2 = exclude_elements(X,i,j);
        R = corrcoef(X1,X2);
        hic_fish_corr(i,j) = R(1,2);
        clear X1 X2
        
        
    end
end
dir_name = out_dir_name;
filename = sprintf('%s_correlated_normalized_distances',file_name);
plot_two_figures_final(exp_corr,hic_fish_corr,dir_name,filename);
dir_name = out_dir_name;
filename = sprintf('%s',file_name);
plot_compartments_final(exp_corr,hic_fish_corr,dir_name,filename);