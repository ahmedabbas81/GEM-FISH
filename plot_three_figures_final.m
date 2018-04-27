function plot_three_figures_final(first_mat,second_mat,third_mat,dir_name,file_name)
 min1 = min(min(min(first_mat)),min(min(second_mat)));
 bottom = min(min1,min(min(third_mat)));
 max1 = max(max(max(first_mat)),max(max(second_mat)));
 top = max(max1,max(max(third_mat)));
figure('units','normalized','outerposition',[0 0 1 0.6])
subplot(1,3,1)
imagesc(first_mat);
xlabel('TAD #')
ylabel('TAD #')
colormap(redblue)
%title('A')
%set(gca, 'units','normalized','OuterPosition', [0.03, 0.05, 0.3, 0.3])
caxis manual
caxis([bottom top])
handle = subplot(1,3,2)
imagesc(second_mat);
colormap(redblue)
%title('B')
xlabel('TAD #')
ylabel('TAD #')

%set(gca,'units','normalized', 'OuterPosition', [0.35, 0.05, 0.3, 0.3])
caxis manual
caxis([bottom top])
handle = subplot(1,3,3)
imagesc(third_mat);
xlabel('TAD number')
ylabel('TAD number')

title('C')
%set(gca, 'units','normalized','OuterPosition', [0.67, 0.05, 0.3, 0.3])
caxis manual
caxis([bottom top])
colormap(redblue)
p = get(handle,'position');
colorbar('location','Manual','position', [p(1)+p(3)+0.02 p(2) 0.015 p(4)]);
filename = sprintf('./%s/%s.fig',dir_name,file_name);
saveas(gcf,filename); 
filename = sprintf('./%s/%s.png',dir_name,file_name);
saveas(gcf,filename); 
close

% figure,%('units','pixels','outerposition',[0 0 380 380]);
% subplot(1,2,1)
% imagesc(first_mat);
% colormap(redblue)
% %title('B')
% xlabel('TAD #')
% ylabel('TAD #')
% caxis manual
% caxis([min1 max1])
% colorbar
% filename = sprintf('./%s/%s_hic_fish.fig',dir_name,file_name);
% hold
% subplot(1,2,2)
% imagesc(second_mat);
% colormap(redblue)
% %title('B')
% xlabel('TAD #')
% ylabel('TAD #')
% colorbar
% saveas(gcf,filename); 
% close
