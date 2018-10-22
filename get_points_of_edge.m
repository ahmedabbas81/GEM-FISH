function points_of_an_edge = get_points_of_edge(P1, P2, resolution)
l = P2(1) - P1(1);
m = P2(2) - P1(2);
n = P2(3) - P1(3);
x1 = P1(1);
x2 = P2(1);
y1 = P1(2);
y2 = P2(1);
z1 = P1(3);
z2 = P2(3);
k = 1;
if(x2<x1)
    resolution = -resolution;
end
for i = x1:resolution:x2
    P(1) = i;
    P(2) = (m/l)*(i-x1)+y1;%s_ind2*delta+y1;
    P(3) = (n/l)*(i-x1)+z1;
    points_of_an_edge(k,:) = P(:);
    k = k + 1;
end