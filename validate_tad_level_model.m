%clear all
for chr = 21:21
        chr_num = num2str(chr);
        fish_distances_file = sprintf('fish_distances_chr%s.csv',chr_num);
        D = csvread(fish_distances_file);
        D = D*1000;
        tads_file = sprintf('tads_chr%s_hg19.txt',chr_num);
        tads = load(tads_file);
        [a, b] = calc_spatial_genomic_relation(D,tads);
        E = get_expected_matrix(tads,a,b);
        % test exp. structure
        N_exp = D./E;
        N_exp(isnan(N_exp)) = 1;
        C_exp = get_compartments(N_exp,'Compartment assignments derived from Exp. FISH data');
        % test the GEM-FISH structure
       gem_fish_file = sprintf('./GEM-FISH_TAD-level-resolution/chr_%s_TAD_level_resolution/conformation1.txt',chr_num);
       gem_fish = load(gem_fish_file);
       gem_fish_D = squareform(pdist(gem_fish));
       N_gem_fish = gem_fish_D./E;
       N_gem_fish(isnan(N_gem_fish)) = 1;
       C_gem_fish = get_compartments(N_gem_fish,'Compartment assignments derived from GEM-FISH 3D model');
       [n_gem_fish errors] = calculate_errors(C_exp,C_gem_fish);
       %p_index = calc_polarization_index(C_exp,C_gem_fish,gem_fish);
       sum_re = 0;
       count_re = 0;
       for i1 = 1 : size(D,1)
            for j1 = 1 : size(D,2)
                if(D(i1,j1) ~= 0)
                     relative_error(i1,j1) = abs(D(i1,j1) - gem_fish_D(i1,j1))/D(i1,j1);
                     sum_re = sum_re + relative_error(i1,j1);
                     count_re = count_re + 1;
                end
            end
       end
       avg_re = sum_re/count_re;
       Asp = test_asphericity(gem_fish,3);
       fprintf('Chr%s stats:\n',chr_num);
       fprintf('Number of correcly assigned TADs = %d/%d\n',(size(tads,1)-n_gem_fish),size(tads,1));
       fprintf('Average relative error = %.3f\n',avg_re);
       fprintf('Asphericity value = %.3f\n',Asp);
       
       %%compare inter- vs. intra- compartment pairwise TAD distances
       A_indices = [];
       B_indices = [];
       for i = 1 : length(C_gem_fish)
           if(C_gem_fish(i)>=0)
               A_indices = [A_indices;i];
           else
               B_indices = [B_indices;i];
           end
       end
       inter_dist =[];
       intra_dist =[];
       for i = 1 : size(gem_fish_D,1)
           for j = 1 : size(gem_fish_D,2)
               if(i==j)
                   continue;
               end
               if((ismember(i,A_indices) && ismember(j,A_indices)) || (ismember(i,B_indices) && ismember(j,B_indices)))
                   intra_dist = [intra_dist;gem_fish_D(i,j)];
               else
                   inter_dist = [inter_dist;gem_fish_D(i,j)];
               end
           end
       end
       C1 = [intra_dist;inter_dist];
       G1 = zeros(size(intra_dist,1),1);
       G2 = ones(size(inter_dist,1),1);
       G = [G1;G2];
       pause(3)
       figure,
       boxplot(C1/1000,G);
       ylabel('Distances (\mum)');
       color = ['m','c'];
        h = findobj(gca,'Tag','Box');
        for j=1:length(h)
           patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
        end
        set(gca,'xticklabel',{'Intra-comp.','Inter-comp.'},'FontSize',16)
        p_val = ranksum(intra_dist,inter_dist,'tail','left');
        fprintf('Comparison between intra- vs. inter-compartment pairwise TAD distances: Left-tailed p-value = %.4e\n',p_val);
       
               
end


