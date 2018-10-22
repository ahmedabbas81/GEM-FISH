function C = get_compartments(original,title_text)
for i = 1 : size(original,1)
    for j = 1 : size(original,2)
        X = original(:,i);
        X1 = exclude_elements(X,i,j);
        X = original(:,j);
        X2 = exclude_elements(X,i,j);
        
        R = corrcoef(X1,X2);
        exp_corr(i,j) = R(1,2);
        clear X1 X2
        
    end
end
C = plot_compartments_final(exp_corr,title_text);
% filename = sprintf('%s_normalized',file_name);
% plot_compartments_final(original,hic_fish,hic,dir_name,filename,high_resolution_distances);
%plot_compartments_final(original,hic_fish,hic,dir_name,file_name,high_resolution_distances,volumes_ind,GL_ind)