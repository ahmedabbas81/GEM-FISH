clear all
Dirname = 'Figures_20';
mkdir(Dirname);
CH_coordinates = xlsread('aaf8084_SupportingFile_Suppl1._Excel_seq6_v1.xlsx');
Ncells = 111;
NTADs = 30;
k1 = 1;
for i = 1 : Ncells
    xbar = 0;
    ybar = 0;
    zbar = 0;
    count = 0;
    structure = [];
    for j = 1 : NTADs
        %for k = 1 : NTADs
            if(isnan(CH_coordinates((i-1)*NTADs +j, 3)))
                %spatial_distances(i, j, k) = -10;
                continue;
            end
           
            x1 = CH_coordinates((i-1)*NTADs +j, 3);
            y1 = CH_coordinates((i-1)*NTADs +j, 4);
            z1 = CH_coordinates((i-1)*NTADs +j, 5);
            Point = [x1, y1, z1];
            structure = [structure; Point];
            xbar = xbar + x1;
            ybar = ybar + y1;
            zbar = zbar + z1;
            count = count + 1;
            
        %end
    end
    [rotmat,cornerpoints,volume,surface,diameter] = minboundbox(structure(:,1), structure(:,2), structure(:,3),'v',3);
    xbar = xbar/count;
    ybar = ybar/count;
    zbar = zbar/count;
    center = [xbar, ybar, zbar];
    sumR = 0;
    count = 0;
    maxR = 0;
    for j = 1 : NTADs
        %for k = 1 : NTADs
            if(isnan(CH_coordinates((i-1)*NTADs +j, 3)))
                %spatial_distances(i, j, k) = -10;
                continue;
            end
           
            x1 = CH_coordinates((i-1)*NTADs +j, 3);
            y1 = CH_coordinates((i-1)*NTADs +j, 4);
            z1 = CH_coordinates((i-1)*NTADs +j, 5);
            P = [x1, y1, z1];
            R = norm(center - P);
            sumR = sumR + R^2;
            count = count + 1;
            if(R > maxR)
                maxR = R;
            end
            
        %end
    end

        Rg(k1) = sqrt(sumR/count);
        Size_Ch(k1) = diameter;
        volumes(k1) = volume;
        k1 = k1 + 1;
end
figure, hist(volumes)
title('Hitogram of volumes');
filename = sprintf('./%s/volume_histogram.png',Dirname);
saveas(gcf,filename)

figure, hist(Size_Ch)
title('Histogram of sizes')
filename = sprintf('./%s/sizes_histogram.png',Dirname);
saveas(gcf,filename)

% %[fun,goff]=fit(Rg',volumes','power1');
p1 = polyfitZero(Rg, Size_Ch, 1)
f = polyval(p1, Rg);
t = sprintf('slope = %.2f',p1(1));

figure, plot(Rg, Size_Ch, 'x', Rg, f, '-');
xlabel('Rg')
ylabel('Size')
title(t)
filename = sprintf('./%s/rg_size_relation.png',Dirname);
saveas(gcf,filename)
% title('size of chromosome = 2.76 x Rg')
% saveas(gcf,'./Progress_Report_Figures2/Rg_vs_size.png');
% close
% 
% [fun,goff]=fit(volumes',Size_Ch','power1');
% fitvalues=coeffvalues(fun)
% %filename = sprintf('./%s/plot_%d_iteration.png',internal_dir_name,k);
% figure,plot(fun,volumes',Size_Ch');
% % avg = mean(Rg)
% % avg_size = mean(Size_Ch)
% % figure,histfit(V, 10, 'lognormal')
% % parmhat = lognfit(V)
parmhat = lognfit(volumes)
h = histfit(volumes,10,'lognormal')
figure,histfit(volumes,10,'lognormal')
m = exp(parmhat(1)-parmhat(2)^2);
t = sprintf('mu = %.2f, sigma = %.2f, peak at %.2f',parmhat(1),parmhat(2),m);
title(t)
filename = sprintf('./%s/fitting_lognormal.png',Dirname);
saveas(gcf,filename)

% close
% h = gca;
% h.XTick = [0 : 0.5 : 14];
% 
% %x = (10:1000:125010)';
% % y = lognpdf(volumes,parmhat(1),parmhat(2));
% % 
% % figure;
% % plot(volumes,'x',y,'-')
% % clear Rg Size_Ch
% % %% Ignore if maxR > 5
% % i1 = 1;
% % for i = 1 : Ncells
% %     xbar = 0;
% %     ybar = 0;
% %     zbar = 0;
% %     count = 0;
% %     for j = 1 : NTADs
% %         %for k = 1 : NTADs
% %             if(isnan(CH_coordinates((i-1)*NTADs +j, 3)))
% %                 %spatial_distances(i, j, k) = -10;
% %                 continue;
% %             end
% %            
% %             x1 = CH_coordinates((i-1)*NTADs +j, 3);
% %             y1 = CH_coordinates((i-1)*NTADs +j, 4);
% %             z1 = CH_coordinates((i-1)*NTADs +j, 5);
% %             xbar = xbar + x1;
% %             ybar = ybar + y1;
% %             zbar = zbar + z1;
% %             count = count + 1;
% %             
% %         %end
% %     end
% %     xbar = xbar/count;
% %     ybar = ybar/count;
% %     zbar = zbar/count;
% %     center = [xbar, ybar, zbar];
% %     sumR = 0;
% %     count = 0;
% %     maxR = 0;
% %     for j = 1 : NTADs
% %         %for k = 1 : NTADs
% %             if(isnan(CH_coordinates((i-1)*NTADs +j, 3)))
% %                 %spatial_distances(i, j, k) = -10;
% %                 continue;
% %             end
% %            
% %             x1 = CH_coordinates((i-1)*NTADs +j, 3);
% %             y1 = CH_coordinates((i-1)*NTADs +j, 4);
% %             z1 = CH_coordinates((i-1)*NTADs +j, 5);
% %             P = [x1, y1, z1];
% %             R = norm(center - P);
% %             sumR = sumR + R^2;
% %             count = count + 1;
% %             if(R > maxR)
% %                 maxR = R;
% %             end
% %             
% %         %end
% %     end
% %     if(maxR < 2)
% %         Rg(i1) = sqrt(sumR/count);
% %         Size_Ch(i1) = 2*maxR;
% %         i1 = i1 + 1;
% %     end
% % end
% % 
% % p1 = polyfitZero(Rg, Size_Ch, 1)
% % f = polyval(p1, Rg);
% % figure, plot(Rg, Size_Ch, 'x', Rg, f, '-');