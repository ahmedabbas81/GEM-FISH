function [angle, axis_rotation] = find_angle_axis(v1, v2)
cos_angle = dot(v1, v2)/(norm(v1)*norm(v2));
angle = acos(cos_angle);

axis = cross(v1, v2);
axis_rotation = axis/norm(axis);

