function [n errors] = calculate_errors(a,b)
n1 = 0;
e1 = [];
for i = 1 : length(a)
    if(sign(a(i))~=sign(b(i)))
        n1 = n1+1;
        e1 = [e1;i];
    end
end
n2 = 0;
e2 = [];
for i = 1 : length(a)
    if(sign(a(i))==sign(b(i)))
        n2 = n2+1;
        e2 = [e2;i];
    end
end

if(n1 <= n2)
    n = n1;
    errors = e1;
else
    n = n2;
    errors = e2;
end