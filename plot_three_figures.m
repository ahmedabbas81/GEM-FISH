function plot_three_figures(first_mat, second_mat, third_mat,title1,title2,title3,dir_name,file_name)
min1 = min(min(min(first_mat)),min(min(second_mat)));
bottom = min(min1,min(min(third_mat)));
max1 = max(max(max(first_mat)),max(max(second_mat)));
top = max(max1,max(max(third_mat)));
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,3,1)
imagesc(first_mat);
title(title1)
caxis manual
caxis([bottom top])
subplot(1,3,2)
imagesc(second_mat);
title(title2)
caxis manual
caxis([bottom top])
subplot(1,3,3)
imagesc(third_mat);
title(title3)
caxis manual
caxis([bottom top])
colorbar('location','Manual', 'location', 'eastoutside');%'position', [0.93 0.1 0.02 0.81]);
filename = sprintf('./%s/%s',dir_name,file_name);
saveas(gcf,filename); 
close