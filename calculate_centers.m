function centers = calculate_centers(all_segments, blocks)
number_of_segments = size(all_segments,1);
dim = size(all_segments,3);
for i = 1 : number_of_segments
    segment(:,:) = all_segments(i,1:blocks(i),:);
    for j = 1 : dim
        centers(i,j) = mean(segment(:,j));
    end
    clear segment
end
