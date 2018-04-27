function [slope_exp,cc_exp,slope_hic_fish,cc_hic_fish,slope_hic,cc_hic] = get_corr_coef(hic,distances_exp,distances_hic_fish,distances_hic,ntads,dir_name)

Average_distances = distances;
hiC_matrix_mex = hic;
k = 1;
nTADs = ntads;
for i = 1 : nTADs
    for j = 1 :nTADs
        if(i == j || hiC_matrix_mex(i,j) == 0)
            continue;
        end
        Spatial_exp(k) = log10(distances_exp(i,j));
        Spatial_hic_fish(k) = log10(distances_hic_fish(i,j));
        Spatial_hic(k) = log10(distances_hic(i,j));
        HiC1(k) = log10(1/(hiC_matrix_mex(i,j)));
        
        k = k +1;
    end
end

p_exp = fit(Spatial_exp, HiC1,'poly1');
p_hic_fish = fit(Spatial_hic_fish, HiC1,'poly1');
p_hic = fit(Spatial_hic, HiC1,'poly1');
fprintf('Polynomial coefficients for FISH and HIC LOGS = %.2f, %.2f\n',p(1), p(2));
slope_exp = p_exp(1);
slope_hic_fish = p_hic_fish(1);
slope_hic = p_hic(1);
R = corrcoef(Spatial_exp, (HiC1));
cc_exp = R(1,2);
R = corrcoef(Spatial_hic_fish, (HiC1));
cc_hic_fish = R(1,2);
R = corrcoef(Spatial_hic, (HiC1));
cc_hic = R(1,2);

figure,
plot(p_exp,'b');
hold on
plot(p_hic_fish,'c');
hold on
plot(p_hic,'m');
hold off
legend('Experimental FISH','GEM-FISH','GEM');
% k = 1;
% for k = 1 : size(Spatial1,2)
%     HiC2(k) = p(1)*(Spatial1(k)) + p(2);
% end
% figure, plot((Spatial1), HiC2, '- r');
file_name = sprintf('%s/slope_corr_coef.png',dir_name);
saveas(gcf,file_name);
% R = corrcoef(Spatial1, (HiC1));
% cc = R(1,2);
% fprintf('Corr Coef between FISH Distances and Calculated%d Distances = %.2f\n',R(1,2));