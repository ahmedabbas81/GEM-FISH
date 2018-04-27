function [new_struct,distances_tads_new]=build_structure(centers2,all_segments_translated,blocks,d_prior,max_iter,alpha,ntads,results_file,dir_name)
original_segments = all_segments_translated;
relative_error_old = zeros(1,ntads-1);
sum_re_old = 0;
k1 = 1;
for i = 1 : ntads
    for j = 1 : blocks(i)
        new_struct(k1,:) = all_segments_translated(i,j,:); 
        k1 = k1 + 1;
    end
end

cc = 0;
while(1)
    [all_segments_translated_new,relative_error,df,diff] = build_structure_gradient_descent(all_segments_translated,blocks,max_iter,centers2,d_prior,ntads,alpha,dir_name);
    %break;
    max_re = 0;
    for i = 1 : length(relative_error)
        if(relative_error(i)>0.2)%max_re)%(relative_error(i) - relative_error_old(i))> 0 && (relative_error(i) - relative_error_old(i)) > max_re)
            max_re = relative_error(i);
            index = i;
            for i1 = 1 : blocks(index)
                segment_to_reflect(i1,:) = original_segments(index,i1,:);
            end
            reflected_segment = reflect_segment(segment_to_reflect,centers2(index,:));
            for i1 = 1 : size(reflected_segment,1)
                original_segments(index,i1,:) = reflected_segment(i1,:);
            end
            %break;
        end
    end
%     for i = 1 : blocks(index)
%         segment_to_reflect(i,:) = original_segments(index,i,:);
%     end
    
    all_segments_translated = original_segments;
    diff_re = abs(relative_error - relative_error_old);
    sum_re = sum(diff_re);
    cc = cc + 1;
    relative_error_old = relative_error;
    if(sum_re < 0.1 || abs(sum_re-sum_re_old) < 0.1 || cc>5)
        break;
    end
    sum_re_old = sum_re;
end
        
fid_results = fopen(results_file,'w');
fprintf(fid_results,'estimated_distance, calculated_distance, abs_error, relative_error\n');
for i = 1 : size(d_prior,2)
    fprintf(fid_results,'%.4f,%.4f,%.4f,%.4f\n',d_prior(i),df(i),diff(i),relative_error(i));
end
k1 = 1;
k2 = 1;
k3 = 1;
sum_volumes = 0;
volumes_ind = [];
diameters_ind = [];
GL_ind = [];
for i1 = 1 : ntads
    for i2 = 1 : ntads
        if(i1 == i2)
            distances_tads_new(i1,i2) = 0;
            continue;
        end
        n_dist = 0;
        sum_dist = 0;
        for j1 = 1 : blocks(i1)
            P1 = all_segments_translated_new(i1,j1,:); 
            for j2 = 1 : blocks(i2)
                P2 = all_segments_translated_new(i2,j2,:); 
                distance = sqrt((P1(1)-P2(1))^2 + (P1(2)-P2(2))^2 + (P1(3)-P2(3))^2);%norm(P1-P2);
                sum_dist = sum_dist + distance;
                n_dist = n_dist + 1;
            end
        end
        final_dist = sum_dist/n_dist;
        distances_tads_new(i1,i2) = final_dist;
    end
end
                
k1 = 1;                
       
for i = 1 : ntads

    for j = 1 : blocks(i)
        new_struct(k1,:) = all_segments_translated_new(i,j,:); 
        
        k1 = k1 + 1;
    end
 
end

