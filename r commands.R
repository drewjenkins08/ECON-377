### Useful R Commands for quizzes/tests
library(wooldridge)
data("wage1")
data("bwght")
data('ceosal1')

### General Notes:
 ## Prediction vs.Predicted Change:
   # Prediction: yhat = bhat_0 + bhat_1 * x
   # Predicted Change: delta_yhat = bhat_1 * delta_x
 ## OLS residuals always = 0
 ##


## variance (Sx^2):
x = c(1,1,1)
var(x)
# or (given EX and EX^2):
EX2 = 4
EX = 20
EX2 - EX^2
# or given n and sample variance:
n <- 33
var <- 13 # Sy2
SST <- var * (n - 1)
SST

## standard deviation (Sx):
x = c(0,6,2)
sd(x)

## covariance (Sxy):
x = c(1,1,1)
y = c(1,1,1)
cov(x, y)
# or given a table with x and y with probabilities
x = c(5,6,5)
y = c(5,6,2)
probs = c(.2,.3,.5)
EX = sum(x * probs)
EY = sum(y * probs)
EXY = sum(x * y * probs)
EXY - EX * EY
# or if given x and y vectors
x <- c(6, 3, 6)
y <- c(0, 4, 1)
xbar <- mean(x)
ybar <- mean(y)
cov_xy <- sum((x - xbar) * (y - ybar)) / (length(x) - 1)
cov_xy

## correlation: (range: [-1, 1])
EXY = 1
EX = 1
EY = 1
EXY - EX * EY
# or (given cov and sd(x and y)):
covxy = 1
sdx = 4
sdy = 5
covxy / (sdx * sdy)
# or given a x, y, and probs
x = c(2, 3, 4, 8)
y = c(1, 10, 12, 3)
p = c(0.2, 0.3, 0.4, 0.1)
EX = sum(x * p)
EY = sum(y * p)
EXY = sum(x * y * p)
covXY = EXY - EX * EY
EX2 = sum(x^2 * p)
EY2 = sum(y^2 * p)
varX = EX2 - EX^2
varY = EY2 - EY^2
sdX = sqrt(varX)
sdY = sqrt(varY)
corXY = covXY / (sdX * sdY)
corXY

## percent change:
xnew = 1
xold = 1
(xnew - xold) / xold * 100

## percentage point change (difference in the actual points):
xnew = 1
xold = 1
xnew - xold

## E[X]:
values = c(6,4,5)
prob = c(.2,.3,.5)
sum(values * prob)

## E[X^2]:
values = c(8,5,7)
prob = c(.2,.5,.3)
sum((values^2) * prob)

## E[aX + bY]:
a = 3
b = 5
EX = 3
EY = 3
(a * EX) + (b * EY)

## Var(aX + bY):
varx = 5
vary = 11
covxy = -3.6
a = 3
b = -2
a^2 * varx + b^2 * vary + 2 * a * b * covxy

## E[Y | X = x]:
values = c(4,0,5)
probs = c(.2,.3,.5)
sum(values * probs)

## E[aY + b | X = x]:
EYX = 6
a = 3
b = 7
a * EYX + b

## OLS, regressing y on x:
x = c(1,5,8,9,13,15)
y = c(4,6,6,13,4,13)
reg = lm(y ~ x)
uhat = resid(reg)
sum(x * uhat)

## OLS slope (bhat_1):
covxy = 1
varx = 1
covxy / varx
# or given vectors:
x = c(6,5,8)
y = c(1,8,4)
cov(x, y) / var(x)
# or given a table of x, y, and probs:
x = c(6,5,8)
y = c(1,8,4)
probs = c(.2,.3,.5)
EX = sum(x * probs)
EY = sum(y * probs)
EXY = sum(x * y * probs)
EX2 = sum(x^2 * probs)
covxy = EXY - EX * EY
varx = EX2 - EX^2
covxy / varx # = Sxy / Sx^2
# or given wooldridge data
reg = lm(wage ~ educ, wage1)
b1 = reg$coefficents[2]

## OLS intercept (bhat_0):
xbar = 1
ybar = 1
bhat_1 = 1
ybar - bhat_1 * xbar
# or if given vectors for x and y:
x = c(2,7,2)
y = c(2,0,2)
xbar = mean(x)
ybar = mean(y)
bhat_1 = cov(x, y) / var(x)
ybar - bhat_1 * xbar
# or given wooldridge data:
reg2 = lm(wage ~ educ, data = wage1)
b0 = reg2$coefficients[1]

## fitted regression line (finding yhat):
b0 = -.91
b1 = .54
x = 4
b0 + b1 * x
# or finding OLS line and predicted yhat at given x value:
x = c(1,6,4)
y = c(4,10,3)
xbar = mean(x)
ybar = mean(y)
b1 = cov(x, y) / var(x)
b0 = mean(y) - mean(x) * b1
b0 + b1 * 6 # in coefficient put thex value your predicted at

## for sample x and y vectors, find OLS slope:
x = c(2,3,6)
y = c(8,3,4)
sum((x - mean(x)) * (y - mean(y))) / sum((x - mean(x))^2)

## finding SSR from yhat and given vectors:
x = c(4,9,7)
y = c(14,2,13)
yhat = -1 + 8/10 * x  # make sure to change fraction
sum((y - yhat)^2)

# SST = Total Sum of Squares (sum(yi - ybar)^2)
# SSR = Sum of Squared Residuals (sum(yhat - bhat_0 - bhat_1 * xi)^2)
# SSE = Sum of Squares Error

## SSE = SST - SSR (finding SSE from SST and SSR):
SST = 374
SSR = 88
SST - SSR

## R^2 = 1 - SSR / SST (finding R^2 from SSR and SST):
SSR = 264
SST = 2
1 - SSR / SST
# what fraction of variation in y is unexplained:
SSR = 96
SST = 264
SSR / SST
# SSR = (1 - R^2) * SST (finding SSR from R^2 and SST):
SST = 121
R2 = .25
(1 - R2) * SST
# SSR from SSE and R^2:
SSE = 121
R2  = 0.25
SST = SSE / R2
SST - SSE

## R^2 = SSE / SST (finding r^2 from SSE and SST):
SSE = 72
SST = 339
SSE / SST
# finging SSE from wooldridge:
sum(reg$residuals^2)

## sample size (how many ____ are in sample):
nrow(wage1)

## sample mean:
mean(wage1$wage)

## sample standard deviation:
sd(wage1$educ)

## R^2 from wooldridge data:
sum((wage1$wage - mean(wage1$wage))^2)
summary(reg)$r.squared

## level-log finding change in y from change in x:
beta1 = 47.3
deltax = 18
(beta1 / 100) * deltax

## log-log finding change in y from a change in x:
beta1 = 1.22
deltax = 18
beta1 * deltax


## Quiz 9:
# PS10:
# 2: finding what percent y falls given OLS
beta1 = .07
dx = -1
100 * beta1 * dx

# 3: wooldridge, how bwght changes when family incomes rises by 20%
reg = lm(log(bwght) ~ log(faminc), data = bwght)
b1 = reg$coefficients[2]
deltax = 20
b1 * deltax

# 7: finding seb1 given n, sdx, sigmahat
n = 22
sdx = .5
sigmahat = 7.6
SSTx = (n - 1) * sdx^2
seb1 = sigmahat / sqrt(SSTx)
seb1

# 9: finding new deb1 given a change in sample
sdb1 = .75
changex = 9
sdb1 / sqrt(changex)

# 12: finding yhat given MLR OLS and x values
b0 = 4
b1 = 2.4
b2 = .8
x1 = 8
x2 = 7
b0 + b1 * x1 + b2 * x2

# 13: finding yhat given MLS OLS and deltax (ignores b0)
b1 = 3.8
b2 = -.7
deltax1 = 6
deltax2 = 4
b1 * deltax1 + b2 * deltax2

# 14: wooldridge, finding predicted wage given values of educ, exper, tenure
reg2 = lm(wage ~ educ + exper + tenure, data = wage1)
b1 = reg2$coefficients[1]
b2 = reg2$coefficients[2]
b3 = reg2$coefficients[3]
b4 = reg2$coefficients[4]
educvalue = 14
expervalue = 10
tenurevalue = 5
b1 + b2 * educvalue + b3 * expervalue + b4 * tenurevalue

# 15: wooldridge, finding predicted wage if tenure rises by 3 yrs, educ and exper fixed
reg2 = lm(wage ~ educ + exper + tenure, data = wage1)
b4 = reg2$coefficients[4]
deltatenure = 3
b4 * deltatenure

### non-R questions:
## 1: A regression gives yhat = 12 + 8log(income), what does the 8 mean?
# 1% rise in income is about 0.08 points in the predicted test score
## 4: Suppose you could draw 1,000 samples from population and compute b1hat in each one, if OLS unbiased which true?
# the average of the 1000 estimates is close to b1
## 6: Var(b1hat) = sigma^2 / SSTx, what would make Var(b1hat) larger?
# anything that results in a smaller SSTx or a larger error variance (sigma^2)
