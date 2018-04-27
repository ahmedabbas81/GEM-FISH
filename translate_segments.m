function all_segments_translated = translate_segments(all_segments,global_structure,centers,blocks)
number_of_segments = size(all_segments,1);
all_segments_translated = zeros(size(all_segments,1), size(all_segments,2), size(all_segments,3));
dim = size(all_segments,3);
for i = 1 : number_of_segments
    diff(1,:) = global_structure(i,:) - centers(i,:);
    for j = 1 : blocks(i)
        for k = 1 : dim
            all_segments_translated(i, j, k) = all_segments(i, j, k) + diff(1, k);
        end
    end
end