function [all_segments_translated,relative_error,df,diff] = build_structure_gradient_descent(all_segments_translated,blocks,max_iter,centers2,d_prior,ntads,alpha,dir_name)
der_old = zeros(ntads-1,3);
oldC = 0;
C = 0;
qcount = 0;
for iter = 1 : max_iter 
    oldC = C;
    k1 = 1;
    for i = 1 : ntads
        for j = 1 : blocks(i)
            new_struct(iter,k1,:) = all_segments_translated(i,j,:); 
            k1 = k1 + 1;
        end
    end
    flag1 = 1;
    [y_start, y_end] = build_Y_vectors(all_segments_translated,blocks);
    for f = 1 : size(y_start,1)
        df(f) = norm(y_start(f,:) - y_end(f,:));
    end

    der = calculate_derivative_high_resolution(y_start, y_end, d_prior);
    diff_der = der - der_old;
    sum_der = 0;
    for h = 1 : size(diff_der,1)
        sum_der = sum_der + norm(diff_der(h,:));
    end
    C = sum(abs(d_prior - df));
    if(mod(iter,1000)==0)
        %sum(abs(d_prior - df))
        alpha = alpha * 2;
    end
    if(sum(abs(d_prior - df))<0.1)
        break;
    end

    for j = 1 : size(y_start,1)
        y_start_New(j,:) = y_start(j,:) - alpha*der(j,:);
        % calculate the angle of rotation
        % calculate the two vectors
        v1 = y_start(j,:) - centers2(j+1,:);
        v2 = y_start_New(j,:) - centers2(j+1,:);
        [angle, axis_rotation] = find_angle_axis(v1, v2);
        if(angle < 0.001)
            continue;
        end
        R = build_Rotation_Matrix(angle, axis_rotation);
        
        Tx = centers2(j+1,1);
        Ty = centers2(j+1,2);
        Tz = centers2(j+1,3);
        T1 = [1, 0, 0, Tx; 0, 1, 0, Ty; 0, 0, 1, Tz; 0, 0, 0, 1];
        T2 = [1, 0, 0, -Tx; 0, 1, 0, -Ty; 0, 0, 1, -Tz; 0, 0, 0, 1];
        segment(:,:) = all_segments_translated(j+1, 1:blocks(j+1), :);
        flag = 1;
        for l = 1 : size(segment, 1)
            Point(1:3,1) = segment(l,:);
            Point(4,1) = 1;

            Point2 = T1*R*T2*Point;
            if(isreal(Point2) == 0)
                fprintf('\nstart trouble');
                Point2;
                flag = 0;
                break;
            end
            segment(l,1:3) = Point2(1:3,1);
        end
        if(flag == 0)
            flag1 = 0;
            break;
        end
        all_segments_translated(j+1, 1:size(segment,1), :) = segment(:,:);
        clear segment
    end
    if(flag1==0)
        break;
    end
    der_old = der;
    
    if(abs(C-oldC) < 0.01)
        qcount = qcount + 1;
    else
        qcount = 0;
    end
    if(qcount > 50)
        break;
    end
    
end


diff = abs(d_prior - df);
relative_error = diff./d_prior;