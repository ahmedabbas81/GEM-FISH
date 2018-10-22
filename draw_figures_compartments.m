function draw_figures_compartments(chr_num_string,dataset,parent_folder,dir_name)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = sprintf('%s/chr_%s_outputs/using_square_difference/compartments.mat',parent_folder,chr_num_string);
load(filename);
figure,%('units','normalized','outerposition',[0 0 1 0.6])

if(strcmp(chr_num_string,'20'))% || strcmp(chr_num_string,'Xa'))
    bar(-X1_O,'b');
    hold
    bar(-X2_O,'r');
else
    bar(X1_O,'r');
    hold
    bar(X2_O,'b');
end
    
xlim([0 size(X1,1)+1])
%ylim([min_limit-0.02 max_limit+0.02])
xlabel('TAD #','FontSize',18);
xt = get(gca, 'XTick');
set(gca, 'FontSize', 18)
ylabel('Principal component coefficient','FontSize',18);
xt = get(gca, 'YTick');
set(gca, 'FontSize', 18)

% ['\fontsize{14}', AirfoilName];
t = sprintf('Chr%s\nExp. FISH',chr_num_string);
title(t,'fontweight','normal');
set(gca, 'FontSize', 18)
filename = sprintf('%s/chr_%s_Exp-FISH.png',dir_name,chr_num_string)
saveas(gcf,filename);
pause(1)
figure,%('units','normalized','outerposition',[0 0 1 0.6])
if(strcmp(chr_num_string,'22') || strcmp(chr_num_string,'20'))
    bar(-X1_F,'b');
    hold
    bar(-X2_F,'r');
else
    bar(X1_F,'r');
    hold
    bar(X2_F,'b');
end
xlim([0 size(X1,1)+1])
%ylim([min_limit-0.02 max_limit+0.02])
xlabel('TAD #','FontSize',18);
ylabel('Principal component coefficient','FontSize',18);
t = sprintf('Chr%s\nGEM-FISH',chr_num_string);
title(t,'FontWeight','normal')
set(gca, 'FontSize', 18)
filename = sprintf('%s/chr_%s_GEM-FISH.png',dir_name,chr_num_string)
saveas(gcf,filename);
pause(1)

%close
figure,%('units','normalized','outerposition',[0 0 1 0.6])
bar(-X1,'b');
hold
bar(-X2,'r');
xlim([0 size(X1,1)+1])
%ylim([min_limit-0.02 max_limit+0.02])
xlabel('TAD #','FontSize',18);
ylabel('Principal component coefficient','FontSize',18);
t = sprintf('Chr%s\nGEM',chr_num_string);
title(t,'FontWeight','normal')
set(gca, 'FontSize', 18)
filename = sprintf('%s/chr_%s_GEM.png',dir_name,chr_num_string)
saveas(gcf,filename);
pause(1)

%sprintf('/home/ahmed/Documents/Programs_outputs//Rao_data/Rao_files_%s_5kb/hic_tads_level_5kb.txt',chr_num_string);