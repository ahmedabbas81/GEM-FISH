function [Rg_sq, center] = calcRg(structure)
xbar = mean(structure(:,1));
ybar = mean(structure(:,2));
zbar = mean(structure(:,3));
center = [xbar, ybar, zbar];
sumR = 0;
for i = 1 : size(structure,1)
    P = structure(i,:);
    R = norm(center - P);
    sumR = sumR + R^2;
end
Rg_sq = sumR/size(structure,1);