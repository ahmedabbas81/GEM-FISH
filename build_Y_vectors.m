function [y_start, y_end] = build_Y_vectors(S_new, blocks)

number_of_segments = size(S_new,1);

for i = 1 : number_of_segments - 1
    y_start(i,:) = S_new(i+1,1,:);
    y_end(i,:) = S_new(i, blocks(1,i), :);
end
