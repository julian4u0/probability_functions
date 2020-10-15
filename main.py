import dis

# 8 choose 4
print("8 choose 4:")
print(dis.choose(8, 4))

# p(X = x) X ~ Bin(n, p)
print("p(X = x) X ~ Bin(n, p):")
print(dis.bin(x = 81, n = 100, p = 0.8))

# p(X <= x) X ~ Bin(n, p)
print("P(X <= x) X ~ Bin(n, p):")
print(dis.pbin(x = 81, n = 100, p = 0.8))

# X ~ Bin(n, p), X info
print("X ~ Bin(n, p), X info:")
print(dis.bininfo(n = 100, p = 0.8))


# P(X = x) X ~ Pois(l (λ))
print("P(X = x) X ~ Pois(l (λ))")
print(dis.pois(x = 3, l = 2))

# P(X <= x) X ~ Pois(l (λ))
print("P(X <= x) X ~ Pois(l (λ))")
print(dis.ppois(x = 14, l = 10))
