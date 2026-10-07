### Useful R Commands for quizzes/tests
library(wooldridge)
data("wage1")
data("bwght")

### General Notes:
 ## Prediction vs.Predicted Change:
   # Prediction: yhat = bhat_0 + bhat_1 * x
   # Predicted Change: delta_yhat = bhat_1 * delta_x


## variance (Sx^2):
x = c(1,1,1)
var(x)
# or (given EX and EX^2):
EX2 = 1
EX = 1
EX2 - EX^2

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
varx = 1
vary = 1
covxy = 0
a = 1
b = 1
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
SST = 315
R2 = 34/100
(1 - R2) * SST

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


# PS 7 scripts:
#1:
nrow(wage1)
#2:
mean(wage1$wage)
#3:
sd(wage1$educ)
#4:
reg = lm(wage ~ educ, data = wage1)
b1 = reg$coefficients[2]
b1
#5:
b0 = reg$coefficients[1]
b0
#6:
b0 + b1 * 14
#7:
b1 * 2
#8:
SSR = sum(reg$residuals^2)
SSR
#9:
summary(reg)$r.squared
#10
reg2 = lm(bwght ~ cigs, data = bwght)
reg2$coefficients[2] * 5
