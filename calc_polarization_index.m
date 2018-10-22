function p_index = calc_polarization_index(first_pc,first_pc2,structure)

ka = 1;
kb = 1;
for i = 1 : size(first_pc,1)
    if(first_pc(i)>0)% || first_pc2(i)>0)
        comp_a(ka,:) = structure(i,:);
        ka = ka + 1;
    end
    if(first_pc(i) < 0)% || first_pc2(i) < 0)
        comp_b(kb,:) = structure(i,:);
        kb = kb + 1;
    end
end

[Ka,Va] = convhull(comp_a);        
[Kb,Vb] = convhull(comp_b);  
% figure,
% trisurf(Ka,comp_a(:,1),comp_a(:,2),comp_a(:,3));
% hold
% trisurf(Kb,comp_b(:,1),comp_b(:,2),comp_b(:,3));
% filename = sprintf('%s_before_rotation.png',file_name);
% saveas(gcf,filename);
% close

center_a = [mean(comp_a(:,1)),mean(comp_a(:,2)),mean(comp_a(:,3))];
center_b = [mean(comp_b(:,1)),mean(comp_b(:,2)),mean(comp_b(:,3))];
c_of_centers = (center_a + center_b)/2;
d = norm(center_a - c_of_centers);
center_a_bar = [c_of_centers(1),c_of_centers(2),c_of_centers(3)+d];
v1 = center_a - c_of_centers;
v2 = center_a_bar - c_of_centers;
[angle, axis_rotation] = find_angle_axis(v1, v2);
rotated_comp_a = rotate_structure(comp_a,angle,axis_rotation,c_of_centers);
rotated_comp_b = rotate_structure(comp_b,angle,axis_rotation,c_of_centers);

%filename = sprintf('%s_2D_XZ.mat',file_name);
threeD_to_2D(rotated_comp_a,rotated_comp_b,1,3);
% [Ka,Va] = convhull(rotated_comp_a);        
% [Kb,Vb] = convhull(rotated_comp_b); 
ka = 1;
kb = 1;
for i = 1 : size(first_pc2,1)
    if(first_pc2(i)>0)% || first_pc2(i)>0)
        comp_a_2(ka,:) = structure(i,:);
        ka = ka + 1;
    end
    if(first_pc2(i) < 0)% || first_pc2(i) < 0)
        comp_b_2(kb,:) = structure(i,:);
        kb = kb + 1;
    end
end

[Ka2,Va2] = convhull(comp_a_2);        
[Kb2,Vb2] = convhull(comp_b_2);  



points_a_in_b = [];
for i = 1 : size(Ka,1)
    P1 = comp_a(Ka(i,1),:);
    P2 = comp_a(Ka(i,2),:);
    P3 = comp_a(Ka(i,3),:);
    edge1 = get_points_of_edge(P1,P2,10);
    points_a_in_b = [points_a_in_b;edge1];
    clear edge1
    edge2 = get_points_of_edge(P1,P3,10);
    points_a_in_b = [points_a_in_b;edge2];
    clear edge2
    edge3 = get_points_of_edge(P2,P3,10);
    points_a_in_b = [points_a_in_b;edge3];
    clear edge3
end
size(points_a_in_b);
points_b_in_a = [];
for i = 1 : size(Kb,1)
    P1 = comp_b(Kb(i,1),:);
    P2 = comp_b(Kb(i,2),:);
    P3 = comp_b(Kb(i,3),:);
    edge1 = get_points_of_edge(P1,P2,10);
    points_b_in_a = [points_b_in_a;edge1];
    clear edge1
    edge2 = get_points_of_edge(P1,P3,10);
    points_b_in_a = [points_b_in_a;edge2];
    clear edge2
    edge3 = get_points_of_edge(P2,P3,10);
    points_b_in_a = [points_b_in_a;edge3];
    clear edge3
end

a_in_b = inhull(points_a_in_b,comp_b_2);
b_in_a = inhull(points_b_in_a,comp_a_2);
sum(a_in_b);
sum(b_in_a);
intersection_points = [];
for i = 1 : size(a_in_b,1)
    if(a_in_b(i) == 1)
        intersection_points = [intersection_points;points_a_in_b(i,:)];
    end
end
for i = 1 : size(b_in_a,1)
    if(b_in_a(i) == 1)
        intersection_points = [intersection_points;points_b_in_a(i,:)];
    end
end
intersection_points = unique(intersection_points,'rows');
if(size(intersection_points,1) > 4)
    [K_int,V_int] = convhull(intersection_points);
else
    V_int = 0;
end
size(intersection_points);
% Va
% Vb
% V_int
p_index = sqrt((1-V_int/Va)*(1-V_int/Vb));
% figure,
% trisurf(Ka,rotated_comp_a(:,1),rotated_comp_a(:,2),rotated_comp_a(:,3));
% hold
% trisurf(Kb,rotated_comp_b(:,1),rotated_comp_b(:,2),rotated_comp_b(:,3));
% t = sprintf('Va = %.2e, Vb = %.2e, Vint = %.2e\np_index = %.4f',Va,Vb,V_int,p_index);
% title(t);
% filename = sprintf('%s_after_rotation.png',file_name);
% saveas(gcf,filename);
% close