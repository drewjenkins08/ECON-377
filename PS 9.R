# 2
b1 = .0029
b1 * 100 * 12

# 3
3.81 + log(1000)

# 4
1.07 * -10

# 5
b1 = .23
deltax = -2
b1 * deltax

library(wooldridge)
data('ceosal1')
data('wage1')
# 6
reg = lm(log(salary) ~ roe, data = ceosal1)
reg$coefficients[2] * 5 * 100

# 7
reg2 = lm(salary ~ log(sales), data = ceosal1)
b1 = (reg2$coefficients[2] / 100) * 10
b1

# 11
sigma2 = 155
sstx = 80
sigma2 / sstx

# 12
n = 10
sx2 = 6
sigma = 13
sstx = (n - 1) * sx2
sigma / sqrt(sstx)

# 14
x = c(1,2,3,7,8)
sigma = 2
sstx = sum((x - mean(x))^2)
sigma / sqrt(sstx)

# 15
ssr = 513
n = 27
ssr / (n - 2)

# 16
n = 11
ssr = 487
sstx = 8
sigma_hat = sqrt(ssr / (n - 2))
sigma_hat / sqrt(sstx)

# 18
reg3 = lm(wage ~ educ, data = wage1)
ssr = sum((reg3$residuals)^2)
sqrt(ssr / (length(wage1$wage) - 2))

# 19
sum((wage1$educ - mean(wage1$educ))^2)
