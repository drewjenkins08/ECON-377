library(wooldridge)
data("wage1")
data("bwght")
data('ceosal1')
data('gpa1')

# 4: finding standard error given k, n, and ssr
n = 49
k = 2
SSR = 1383
df = n - k - 1
sigmahat = sqrt(SSR/df)
sigmahat

# 5: finding SSTj given n, x, and Sxj:
n = 52
Sxj = 4.1
SSTj = (n - 1) * (Sxj)^2
SSTj

# 6: finding se(bhatj)
sigmahat = 11.1
SSTj = 889
Rj2 = .72
sigmahat / sqrt(SSTj * (1 - Rj2))

# 8: wooldridge, finding degrees of freedom
reg = lm(price ~ sqrft + bdrms + lotsize, data = hprice1)
n = nrow(hprice1)
k = 3
df = n - k - 1
df

# 9: using same regression ^, find standard error
SSR = sum(reg$residuals^2)
sigmahat = sqrt(SSR / df)
sigmahat

# 10: compute SSTj for Xj = bdrms
SSTj = sum((hprice1$bdrms - mean(hprice1$bdrms))^2)
SSTj

# 11: using same regression ^, find Rj2 for Xj = bdrms
reg2 = lm(bdrms ~ sqrft + lotsize, data = hprice1)
Rj2 = summary(reg2)$r.squared
Rj2

# 12: using same regression ^, compute se(bhatj) for the bdrms coefficient
sebhatj = sigmahat / sqrt(SSTj * (1 - Rj2))
sebhatj

# 13: using same regression ^, finding standard error a faster way
reg3 = lm(price ~ sqrft + bdrms + lotsize, data = hprice1)
summary(reg3)$coefficients[3, 2]
