function new_col = exclude_elements(col,i,j)
new_col = [];
if(i > j)
    ind1 = j;
    ind2 = i;
else
    ind1 = i;
    ind2 = j;
end
if(ind1 == ind2)
    if(ind1 == 1)
        new_col = [new_col;col(ind1+1:end)];
    else
        new_col = [new_col;col(1:ind1-1)];
        new_col = [new_col;col(ind1+1:end)];
    end
else
    if(ind1 == 1)
        new_col = [new_col;col(ind1+1:ind2-1)];
        new_col = [new_col;col(ind2+1:end)];
    else
        new_col = [new_col;col(1:ind1-1)];
        new_col = [new_col;col(ind1+1:ind2-1)];
        new_col = [new_col;col(ind2+1:end)];
    end
end
        