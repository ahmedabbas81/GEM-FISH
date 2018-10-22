function threeD_to_2D(threeD_object1,threeD_object2,axis1,axis2)
projected_surface1(:,1) = threeD_object1(:,axis1);
x1 = threeD_object1(:,axis1);
projected_surface1(:,2) = threeD_object1(:,axis2);
y1 = threeD_object1(:,axis2);
projected_surface2(:,1) = threeD_object2(:,axis1);
x2 = threeD_object2(:,axis1);
projected_surface2(:,2) = threeD_object2(:,axis2);
y2 = threeD_object2(:,axis2);
k1 = convhull(x1,y1);
k2 = convhull(x2,y2);
figure,
plot(x1(k1),y1(k1),'c-',x1,y1,'b*')
hold
plot(x2(k2),y2(k2),'m-',x2,y2,'ro')
%file_name = sprintf('%s/%s.png',dirname,filename);
%saveas(gcf,filename);
%close
%file_name = sprintf('%s',dir_name,filename);
%save(filename,'x1','y1','x2','y2','k1','k2','x3','y3','k3','x4','y4','k4');