function plot_compartments(original,hic_fish,hic_fish_high_resolution,hic,title1,title2,title3,title4,dir_name,file_name,file_name_original)
coeffs_original = pca(original);
orig_coef = coeffs_original(:,1);
X1 = coeffs_original(:,1);
X1(X1<0) = 0;
X2 = coeffs_original(:,1);
X2(X2>0) = 0;
figure,
bar(X1,'r');
hold
bar(X2,'b');
%xticks([1 : 3 : size(X1,1)])
title(title1)
filename = sprintf('./%s/%s',dir_name,file_name_original);
saveas(gcf,filename); 
close
figure('units','normalized','outerposition',[0 0 1 1]);
subplot(2,2,1)
bar(X1,'r');
hold
bar(X2,'b');
%xticks([1 : 3 : size(X1,1)])
title(title1)
hold
coeffs_hic_fish = pca(hic_fish);
hic_fish_coef = coeffs_hic_fish(:,1);
%%calculate errors
[n, e] = calculate_errors(orig_coef,hic_fish_coef);
X1 = coeffs_hic_fish(:,1);
X1(X1<0) = 0;
X2 = coeffs_hic_fish(:,1);
X2(X2>0) = 0;
subplot(2,2,2)
bar(X1,'r');
hold
bar(X2,'b');
%xticks([1 : 3 : size(X1,1)])
title2_new = sprintf('%s\nerrors = %d',title2,n);
title(title2_new)
hold
%%%%%%%%%%%%%%%%%%%%%%%%

coeffs_hic_fish_high_resolution = pca(hic_fish_high_resolution);
hic_fish_high_resolution_coef = coeffs_hic_fish_high_resolution(:,1);
[n, e] = calculate_errors(orig_coef,hic_fish_high_resolution_coef);
X1 = coeffs_hic_fish_high_resolution(:,1);
X1(X1<0) = 0;
X2 = coeffs_hic_fish_high_resolution(:,1);
X2(X2>0) = 0;
subplot(2,2,3)
bar(X1,'r');
hold
bar(X2,'b');
%xticks([1 : 3 : size(X1,1)])
title3_new = sprintf('%s\nerrors = %d',title3,n);
title(title3_new)


coeffs_hic = pca(hic);
hic_coef = coeffs_hic(:,1);
[n, e] = calculate_errors(orig_coef,hic_coef);
X1 = coeffs_hic(:,1);
X1(X1<0) = 0;
X2 = coeffs_hic(:,1);
X2(X2>0) = 0;
subplot(2,2,4)
bar(X1,'r');
hold
bar(X2,'b');
%xticks([1 : 3 : size(X1,1)])
title4_new = sprintf('%s\nerrors = %d',title4,n);
title(title4_new)

filename = sprintf('./%s/%s.png',dir_name,file_name);
saveas(gcf,filename); 
close

%%%%%%

X1 = coeffs_original(:,1);
X1(X1<0) = 0;
X2 = coeffs_original(:,1);
X2(X2>0) = 0;
figure,
bar(X1,'r');
hold
bar(X2,'b');
%xticks([1 : 3 : size(X1,1)])
title(title1)
filename = sprintf('./%s/%s',dir_name,file_name_original);
saveas(gcf,filename); 
close
figure('units','normalized','outerposition',[0 0 1 1]);
subplot(2,2,1)
bar(X1,'r');
hold
bar(X2,'b');
%xticks([1 : 3 : size(X1,1)])
title('a')
hold
coeffs_hic_fish = pca(hic_fish);
hic_fish_coef = coeffs_hic_fish(:,1);
%%calculate errors
[n, e] = calculate_errors(orig_coef,hic_fish_coef);
X1 = coeffs_hic_fish(:,1);
X1(X1<0) = 0;
X2 = coeffs_hic_fish(:,1);
X2(X2>0) = 0;
subplot(2,2,2)
bar(X1,'r');
hold
bar(X2,'b');
%xticks([1 : 3 : size(X1,1)])
title2_new = sprintf('%s\nerrors = %d',title2,n);
title(title2_new)
hold
%%%%%%%%%%%%%%%%%%%%%%%%

coeffs_hic_fish_high_resolution = pca(hic_fish_high_resolution);
hic_fish_high_resolution_coef = coeffs_hic_fish_high_resolution(:,1);
[n, e] = calculate_errors(orig_coef,hic_fish_high_resolution_coef);
X1 = coeffs_hic_fish_high_resolution(:,1);
X1(X1<0) = 0;
X2 = coeffs_hic_fish_high_resolution(:,1);
X2(X2>0) = 0;
subplot(2,2,3)
bar(X1,'r');
hold
bar(X2,'b');
%xticks([1 : 3 : size(X1,1)])
title3_new = sprintf('%s\nerrors = %d',title3,n);
title(title3_new)


coeffs_hic = pca(hic);
hic_coef = coeffs_hic(:,1);
[n, e] = calculate_errors(orig_coef,hic_coef);
X1 = coeffs_hic(:,1);
X1(X1<0) = 0;
X2 = coeffs_hic(:,1);
X2(X2>0) = 0;
subplot(2,2,4)
bar(X1,'r');
hold
bar(X2,'b');
%xticks([1 : 3 : size(X1,1)])
title4_new = sprintf('%s\nerrors = %d',title4,n);
title(title4_new)

filename = sprintf('./%s/%s_letters.png',dir_name,file_name);
saveas(gcf,filename); 
%close