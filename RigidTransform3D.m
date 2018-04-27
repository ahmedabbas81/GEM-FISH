% This function finds the optimal Rigid/Euclidean transform in 3D space
% It expects as input a Nx3 matrix of 3D points.
% It returns R, t
% References:
% Sorkine,O. Least-squares rigid motion using SVD. (2009) Technical notes, 120, 3.


% expects row data
function [R,t] = RigidTransform3D(A, B)
    if nargin ~= 2
	    error('Missing parameters');
    end
    centroid_A = mean(A);
    centroid_B = mean(B);

    N = size(A,1);

    H = (A - repmat(centroid_A, N, 1))' * (B - repmat(centroid_B, N, 1));

    [U,S,V] = svd(H);

    R = V*U';

    if det(R) < 0
        disp('Reflection detected\n');
        V(:,3) = - V(:,3);
        R = V*U';
    end

    t = -R*centroid_A' + centroid_B';
end

