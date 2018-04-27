function plot_three_figures2(first_mat, second_mat, third_mat,title1,title2,title3,dir_name,file_name)
min1 = min(min(min(first_mat)),min(min(second_mat)));
bottom = min(min1,min(min(third_mat)));
max1 = max(max(max(first_mat)),max(max(second_mat)));
top = max(max1,max(max(third_mat)));

% figure,
% imagesc(first_mat);
% title(title1)
% caxis manual
% caxis([bottom top])
% colorbar('location','Manual', 'location', 'eastoutside');
figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,2,1)
imagesc(first_mat);
colormap(jet);
%colorbar
title('a')
caxis manual
caxis([bottom top])
subplot(2,2,2)
imagesc(second_mat);
colormap(jet);
%colorbar
title('b')
%title(title2)
caxis manual
caxis([bottom top])
subplot(2,2,3)
imagesc(third_mat);
colormap(jet);
%colorbar
title('c')
caxis manual
caxis([bottom top])
% subplot(2,2,4)
% imagesc(fourth_mat);
% colormap(jet);
% title('d')
% caxis manual
% caxis([bottom top])
colorbar('location','Manual','position', [0.93 0.12 0.02 0.8]);
%colorbar('location','Manual', 'location', 'eastoutside');%'position', [0.93 0.2 0.02 0.81]);
filename = sprintf('./%s/%s_letters.png',dir_name,file_name);
saveas(gcf,filename); 
close

figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,2,1)
imagesc(first_mat);
colormap(jet);
%colorbar
title(title1)
caxis manual
caxis([bottom top])
subplot(2,2,2)
imagesc(second_mat);
colormap(jet);
%colorbar
title('b')
title(title2)
caxis manual
caxis([bottom top])
subplot(2,2,3)
imagesc(third_mat);
colormap(jet);
%colorbar
title(title3);
caxis manual
caxis([bottom top])
% subplot(2,2,4)
% imagesc(fourth_mat);
% colormap(jet);
% title('d')
% caxis manual
% caxis([bottom top])
colorbar('location','Manual','position', [0.93 0.12 0.02 0.8]);
%colorbar('location','Manual', 'location', 'eastoutside');%'position', [0.93 0.2 0.02 0.81]);
filename = sprintf('./%s/%s.png',dir_name,file_name);
saveas(gcf,filename); 
close