syms k
f = 1/k^2;
V = subs(f, k, 1:10)
S_sum = sum(V)