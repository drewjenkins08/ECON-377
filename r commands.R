### Useful R Commands for quizzes/tests
library(wooldridge)
data("wage1")
data("bwght")
data('ceosal1')
data('gpa1')
data('hprice1')

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
# or if given a sigma and SSTx:
sigma = .81
SSTx = 6
sdx = sigma / sqrt(SSTx)
sdx
# or given sigma and a vector:
x = c(1,3,4,5,9)
sigma = 5
sd_b1 = sigma / sqrt(sum((x - mean(x))^2))
sd_b1

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
# or if given correlatoin, standard deviation, and variance:
corxy = -.6
vary = 4
sdx = 2
corxy * sqrt(vary) / sdx
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

# SSTx = sum(xi - xbar)^2
x = 1
xbar = 1
SST = sum((x - mean(x))^2)
# for wooldridge data:
SSTj <- sum((hprice1$bdrms - mean(hprice1$bdrms))^2)
SSTj

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
## SSR = (1 - R^2) * SST (finding SSR from R^2 and SST):
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

## level-level finding change in y frmo a change in x:
beta1 = 10
x = 10
beta1 * x

## log-level finding change in y from a change in x:
beta1 = .078
x = 2
beta1 * x * 100

## level-log finding change in y from change in x:
beta1 = 56.1
deltax = 7
(beta1 / 100) * deltax

## log-log finding change in y from a change in x:
beta1 = .48
deltax = -16
beta1 * deltax

# finding percent y changes given a change in x1 and x2
b1 = .026
b2 = -.013
x1 = 4
x2 = 4
100 * (b1 * x1 + b2 * x2)

# wooldridge, what percent wage changes when exp and tenure change
reg = lm(log(wage) ~ educ + exper + tenure, data = wage1)
b3 = reg$coefficients[3] # exper
b4 = reg$coefficients[4] # tenure
100 * (bexper * 2 + btenure * 1)

# whats predicted hourly wage of someone with given quantities of educ, exper, tenure
b1 = reg$coefficients[1] # wage
b2 = reg$coefficients[2] # educ
exp(b1 + (b2 * 12) + (b3 * 10) + (b4 * 3))
coef(reg)

# finding sample mean y given x1bar, x2bar and MLR
b0 = 3.9
b1 = 1.9
b2 = -.5
x1 = 7.9
x2 = 3.7
b0 + b1 * x1 + b2 * x2

# finding MLR slope given b1, b2, delta
b1tidle = .73
b2hat = 1.23
delta1tidle = -.33
b1hat = b1tidle - b2hat * delta1tidle
b1hat

# finding b2hat * delta1tidle: from Quiz 10
regMLR = lm(price ~ bdrms + sqrft, data = hprice1)
bhat2MLR = regMLR$coefficients[3]

regSLR = lm(sqrft ~ bdrms, data = hprice1)
deltatidle = regSLR$coefficients[2]
bhat2MLR * deltatidle

# degrees of freedom (df):
n = 1 # if need to do it from wooldridge, remember nrow()
k = 1 # number of independent variables
df = n - k - 1
df

# SSTj: (total sum of squares for a specific independent variable)
SSTj = sum((hprice$bdrms - mean(hprice1$bdrms))^2) # change variable names for different regressions given, (sum of the x value - the mean of x, squared)
SSTj

# sigmahat:
n = 37
SSR = 2354
k = 4
df = n - k - 1 # use this is you have to find it
# df = 1 # use this if your given the df variable
sigmahat = sqrt(SSR / df)
sigmahat
# or given n, and SSR:
n = 35
SSR = 381
sigmahat2 = SSR / (n - 2)
sigmahat2
# wooldridge, finding sigmahat having to find df, and then use df to get sigmahat
reg3 = lm(price ~ sqrft + bdrms + lotsize, data = hprice1)
n = nrow(hprice1)
k = 3
df = n - k - 1
df
SSR = sum(reg3$residuals^2)
sigmahat = sqrt(SSR / df)
sigmahat


# Rj2:
reg = lm(bdrms ~ sqrft + lotsize, data = hprice1)
Rj2 = summary(reg)$r.squared
Rj2

## standard error:
sigmahat = 1
Rj2 = 1
SSTj = 1
se = sigmahat / sqrt(SSTj * (1 - Rj2))
# finding the standard error of b1 given, n, SSR, SSTx
n = 12
SSR = 563
SSTx = 20
sigmahat = SSR / (n - 2)
seb1 = sqrt(sigmahat / SSTx)
seb1
# finding standard error given n, sigmahat, sdx
n = 10
sigmahat = 5.4
sdx = .8
SSTx = (n - 1) * (sdx)^2
sigmahat / sqrt(SSTx)

# finding standard error from a regression: (the fast way)
reg3 = lm(price ~ sqrft + bdrms + lotsize, data = hprice1) # so in this circumstance if you put a 3, you find se of bdrms
summary(reg)$coefficients[__, 2] # assuming MLR, put the variable you are finding the standard error from in the first value of brackets

## finding sample mean y given x1bar, x2bar and MLR
b0 = 2
b1 = .6
b2 = 1.4
x1 = 3
x2 = 7
b0 + b1 * x1 + b2 * x2

## finding change in y given a change in x1 and x2
b1 = 2.5
b2 = -2.7
x1 = 6
x2 = 3
b1 * x1 + b2 * x2

## computing average of a variable at the means of other variables in a MLR
reg2 = lm(colGPA ~ ACT + hsGPA, data = gpa1)
b1 = reg2$coefficients[1] # colGPA
b2 = reg2$coefficients[2] # ACT
b3 = reg2$coefficients[3] # hsGPA
b1 + (b2 * mean(gpa1$ACT) + b3 * mean(gpa1$hsGPA))

## solving for a variable given fixed values for other variables, MLR (change variables to match the problem)
reg = lm(log(wage) ~ educ + exper + tenure, data = wage1)
b1 = reg$coefficients[1] # wage
b2 = reg$coefficients[2] # educ
b3 = reg$coefficients[3] # exper
b4 = reg$coefficients[4] # tenure
exp(b1 + (b2 * 12) + (b3 * 10) + (b4 * 3)) # change the blue numbers for the different values given

## finding b1hat given b1tidle, b2hat, and delta1tidle:
b1tidle = .73
b2hat = 1.23
delta1tidle = -.33
b1hat = b1tidle - b2hat * delta1tidle
b1hat

## finding slope of a indenpendent variable on a dependent variable
reg4 = lm(bwght ~ cigs, data = bwght)
bcigs = reg4$coefficients[2]
bcigs

# finding slope of independent variable on dependent variable, holding another independent fixed
reg5 = lm(bwght ~ cigs + faminc, data = bwght)
bcigsMLR = reg5$coefficients[2]
bcigsMLR

# finding b2hat * delta1tidle from the two prompts above ^^
reg6 = lm(faminc ~ cigs, data = bwght)
delta1 = reg6$coefficients[2]
bfamincMLR = reg5$coefficients[3]
bfamincMLR * delta1

# finding predicted change in log, given a delta in independent variable
reg = (lm(log(salary) ~ roe, data = ceosal1))
b1 = coef(reg)['roe']
deltaroe = 4
b1 * deltaroe * 100
