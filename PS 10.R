# PS 10:
library(wooldridge)
data('bwght')
data('ceosal1')
data('wage1')

# 2:
deltax = -1
b1 = .07
100 * b1 * deltax

# 3:
reg = lm(log(bwght) ~ log(faminc), data = bwght)
b1 = reg$coefficients[2]
changex = 20
b1 * changex

# 7:
n = 22
sigmahat = 7.6
sdx = .5
SSTx = (n - 1) * (sdx)^2
sigmahat / sqrt(SSTx)

# 8:
x = c(1,3,5,9,11)
SSR = 51
n = 5
sigmahat = sqrt(SSR / (n - 2))
SSTx = sum((x - mean(x))^2)
sigmahat / sqrt(SSTx)

# 9:
sdb1 = .75
change = 9
sdb1 / sqrt(change)
  
# 10:
reg2 = lm(salary ~ roe, data = ceosal1)
SSR = sum((reg2$residuals)^2)
n = nrow(ceosal1)
SSTx = sum((ceosal1$roe - mean(ceosal1$roe))^2)
sigmahat = sqrt(SSR / (n - 2))
sigmahat / sqrt(SSTx)

# 12:
x1 = 8
x2 = 7
4 + 2.4 * x1 + .8 * x2

# 13:
deltax1 = 6
deltax2 = 4
3.8 * deltax1 - .7 * deltax2

# 14:
reg3 = lm(wage ~ educ + exper + tenure, data = wage1)
b1 = reg3$coefficients[1]
b2 = reg3$coefficients[2]
b3 = reg3$coefficients[3]
b4 = reg3$coefficients[4]
b1 + b2 * 14 + b3 * 10 + b4 * 5

# 15: 
reg3 = lm(wage ~ educ + exper + tenure, data = wage1)
b1 = reg3$coefficients[1]
b2 = reg3$coefficients[2]
b3 = reg3$coefficients[3]
b4 = reg3$coefficients[4]
b4 * 3

# 16:
reg4 = lm(log(salary) ~ log(sales) + roe, data = ceosal1)
b3 = reg4$coefficients[3]
deltaroe = 10
100 * b3 * deltaroe

# 17:
reg4 = lm(log(salary) ~ log(sales) + roe, data = ceosal1)
b1 = reg4$coefficients[1]
b2 = reg4$coefficients[2]
b3 = reg4$coefficients[3]
exp(b1 + b2 * log(5000) + b3 * 15)

# 18:
b1hat = .49
b2hat = -1.11
se = .61
b1hat + b2hat * se

# 19:
b2 = .69
se = .25
b2 * se

# 20:
reg5 = lm(wage ~ educ + exper, data = wage1)
reg6 = lm(exper ~ educ, data = wage1)
expercoef = reg5$coefficients[3]
educcoef = reg6$coefficients[2]
expercoef * educcoef
