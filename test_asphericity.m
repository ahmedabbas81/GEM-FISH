function A = test_asphericity(s,dim)
%dim = 3;
for i = 1 : dim
    for j = 1 : dim
        T(i,j) = 0;
        for k = 1 : size(s,1)
            xi = s(k,i);
            t1 = xi - mean(s(:,i));
            xj = s(k,j);
            t2 = xj - mean(s(:,j));
            T(i,j) = T(i,j) + t1*t2;
        end
        T(i,j) = T(i,j)/(1.0*size(s,1));
    end
end
lambda = eig(T);

num = 0;
for i = 1 : length(lambda)-1
    for j = i+1 : length(lambda)
        num = num + (lambda(i)-lambda(j))^2;
    end
end
den = sum(lambda);
den = den^2;
den = den * (dim-1);
A = num/den;
      
        
