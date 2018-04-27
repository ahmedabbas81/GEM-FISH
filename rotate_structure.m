function rotated_structure = rotate_structure(structure,angle,axis_rotation,center2)
if(angle < 0.001)
    return;
end
R = build_Rotation_Matrix(angle, axis_rotation);
if(isreal(R) == 0)
    fprintf('\nstart trouble');
    R
    return;
end
Tx = center2(1);
Ty = center2(2);
Tz = center2(3);
T1 = [1, 0, 0, Tx; 0, 1, 0, Ty; 0, 0, 1, Tz; 0, 0, 0, 1];
T2 = [1, 0, 0, -Tx; 0, 1, 0, -Ty; 0, 0, 1, -Tz; 0, 0, 0, 1];
flag = 1;
for l = 1 : size(structure, 1)
    Point(1:3,1) = structure(l,:);
    Point(4,1) = 1;
    Point2 = T1*R*T2*Point;
    if(isreal(Point2) == 0)
        fprintf('\nstart trouble');
        Point2;
        flag = 0;
        break;
    end
    rotated_structure(l,1:3) = Point2(1:3,1);
end
