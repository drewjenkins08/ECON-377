### Useful R Commands for quizzes/tests

## variance:
x = c(1,1,1)
var(x)
# or (given EX and EX^2):
EX2 = 1
EX = 1
EX2 - EX^2

## covariance:
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
# or given x, y and equation:
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
x = c(1,1,1)
y = c(1,1,1)
cov(x, y) / var(x)
# or given a talen of x, y, and probs:
x = c(6,0,2)
y = c(8,7,0)
probs = c(.2,.3,.5)
EX = sum(x * probs)
EY = sum(y * probs)
EXY = sum(x * y * probs)
EX2 = sum(x^2 * probs)
covxy = EXY - EX * EY
varx = EX2 - EX^2
covxy / varx

## OLS slope (bhat_0):
xbar = 1
ybar = 1
bhat_1 = 1
ymean - bhat_1 * xmean
# or if given vectors for x and y:
x = c(4,6,6)
y = c(5,8,2)
xbar = mean(x)
ybar = mean(y)
bhat_1 = cov(x, y) / var(x)
ybar - bhat_1 * xbar

## fitted regression line (finding yhat):
b0 = 1
b1 = 1
x = 1
b0 + b1 * x
# or finding OLS line and predicted yhat at given x value:
x = c(5,6,3)
y = c(10,3,3)
xbar = mean(x)
ybar = mean(y)
num = sum((x - xbar) * (y - ybar))
den = sum((x - xbar)^2)
b1 = num / den
b0 = ybar - b1 * xbar
b0 + b1 * 8 # in coefficient put thex value your predicted at