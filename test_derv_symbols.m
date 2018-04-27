syms f1 f2 x y d
f1 = (norm(x-y)-d)^2
df = diff(f1,x)
f2 = abs(norm(x-y)-d)
df2 = diff(f2,x)