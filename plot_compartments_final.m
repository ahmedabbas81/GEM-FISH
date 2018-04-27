function plot_compartments_final(original,hic_fish,dir_name,file_name)
coeffs_original = pca(original);
orig_coef = coeffs_original(:,1);
X1_O = coeffs_original(:,1);
X1_O(X1_O<0) = 0;
X2_O = coeffs_original(:,1);
X2_O(X2_O>0) = 0;

figure('units','normalized','outerposition',[0 0 1 0.6]);
fname = sprintf('%s/errors_comp_assignment.txt',dir_name);
%fname = 'errors_comp_assignment.txt';
fid = fopen(fname,'w');
max_limit = max(X1_O);
min_limit = min(X2_O);
%xticks([1 : 3 : size(X1,1)])
coeffs_hic_fish = pca(hic_fish);
hic_fish_coef = coeffs_hic_fish(:,1);
%%calculate errors
[n, e] = calculate_errors(orig_coef,hic_fish_coef);
fprintf(fid,'number of errors in hic_fish = %d\n',n);
for i = 1 : length(e)
    fprintf(fid,'error in TAD %d, value in original = %.3f, value in calculated = %.3f\n', e(i),orig_coef(e(i)),hic_fish_coef(e(i)));
end
fprintf(fid,'===================================================');   
X1_F = coeffs_hic_fish(:,1);
X1_F(X1_F<0) = 0;
X2_F = coeffs_hic_fish(:,1);
X2_F(X2_F>0) = 0;

f_name = sprintf('%s/compartments.mat',dir_name);
save(f_name,'X1_O','X2_O','X1_F','X2_F'); 
max_limit = max(max(X1_O),max_limit);
min_limit = min(min(X2_O),min_limit);
subplot(1,2,1)
%figure('units','pixels','outerposition',[0 0 380 380]);
bar(X1_O,'r');
hold
bar(X2_O,'b');
xlim([0 size(X1_O,1)+1])
ylim([min_limit-0.02 max_limit+0.02])
xlabel('TAD #')
ylabel('Principal component coefficient')
hold
subplot(1,2,2)
bar(X1_F,'r');
hold
bar(X2_F,'b');
xlim([0 size(X1_O,1)+1])
ylim([min_limit-0.02 max_limit+0.02])
xlabel('TAD #')
ylabel('Principal component coefficient')
filename = sprintf('./%s/%s_hic_fish.png',dir_name,file_name);
saveas(gcf,filename);
filename = sprintf('./%s/%s_hic_fish.fig',dir_name,file_name);
saveas(gcf,filename);
close
