function reflected_segment = reflect_segment(segment_to_reflect,Center)
xc = Center(1);
yc = Center(2);
for i = 1 : size(segment_to_reflect,1)
    P = segment_to_reflect(i,:);
    xp = P(1);
    yp = P(2);
    zp = P(3);
    if(xp > xc)
        xp = xc - abs(xp-xc);
    else
        xp = xc + abs(xp-xc);
    end
    if(yp > yc)
        yp = yc - abs(yp-yc);
    else
        yp = yc + abs(yp-yc);
    end
    P = [xp,yp,zp];
    reflected_segment(i,:) = P;
end
    