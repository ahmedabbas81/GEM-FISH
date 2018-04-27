function [  ] = LatentFunction( X,ydata_penalty,M,proportions )

% Capture the latent function by comparing the modeled structures with the
% original Hi-C data.

% Frequencies
freq=[];
for i=1:size(X,1)
    for j=1:size(X,2)
        if X(i,j)>0
            freq=[freq;X(i,j)];
        end
    end
end

% Distances
for m=1:M
    dmat=squareform(pdist(ydata_penalty(:,:,m)));
    tdist=[];
    for i=1:size(X,1)
        for j=1:size(X,2)
            if X(i,j)>0
                tdist=[tdist;dmat(i,j)];
            end
        end
    end
    if m==1
        dist=tdist*proportions(m);
    else
        dist=dist+tdist*proportions(m);
    end
end

% Fit based on power model
disp ('Fitting results of latent function: ' );
figure
[fun,goff]=fit(dist,freq,'power1')
fitvalues=coeffvalues(fun)
plot(fun,dist,freq)


% Alternatively, users can perform fitting based on Gaussian model if power function does not fit well.
%{
[fun,goff]=fit(dist,freq,'gauss1')
fitvalues=coeffvalues(fun)
plot(fun,dist,freq)
%}
end

