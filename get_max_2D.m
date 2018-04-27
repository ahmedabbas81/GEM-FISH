function [max_value, ind1, ind2] = get_max_2D(matrix,blocks,loci)
max_value = matrix(1,1);
ind1 = 1;
ind2 = 1;
for i = 1 : size(matrix,1)
    for j = 1 : size(matrix,2)
        if(matrix(i,j) > max_value && (j + loci <= blocks(i)))
            max_value = matrix(i,j);
            ind1 = i;
            ind2 = j;
        end
    end
end