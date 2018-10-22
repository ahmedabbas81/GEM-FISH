function orig_coef = plot_compartments_final(original,title_text)
coeffs_original = pca(original);
orig_coef = coeffs_original(:,1);
X1_O = coeffs_original(:,1);
X1_O(X1_O<0) = 0;
X2_O = coeffs_original(:,1);
X2_O(X2_O>0) = 0;

figure,
max_limit = max(X1_O);
min_limit = min(X2_O);
bar(X1_O,'r');
hold
bar(X2_O,'b');
xlim([0 size(X1_O,1)+1])
ylim([min_limit-0.02 max_limit+0.02])
xlabel('TAD #')
ylabel('Principal component coefficient')
title(title_text);