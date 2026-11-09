library(wooldridge)
data('wage1')
data('gpa1')
data('vote1')
data('bwght')

# 1: finding percent y changes given a change in x1 and x2
b1 = .026
b2 = -.013
x1 = 4
x2 = 4
100 * (b1 * x1 + b2 * x2)

# 2: wooldridge, what percent wage changes when exp and tenure change
reg = lm(log(wage) ~ educ + exper + tenure, data = wage1)
b3 = reg$coefficients[3] # exper
b4 = reg$coefficients[4] # tenure
100 * (bexper * 2 + btenure * 1)

# 3: whats predicted hourly wage of someone with given quantities of educ, exper, tenure
b1 = reg$coefficients[1] # wage
b2 = reg$coefficients[2] # educ
exp(b1 + (b2 * 12) + (b3 * 10) + (b4 * 3))
coef(reg)

# 5: compute colGPA at avg. ACT and hsGPA
reg2 = lm(colGPA ~ ACT + hsGPA, data = gpa1)
b1 = reg2$coefficients[1] # colGPA
b2 = reg2$coefficients[2] # ACT
b3 = reg2$coefficients[3] # hsGPA
b1 + (b2 * mean(gpa1$ACT) + b3 * mean(gpa1$hsGPA))

# 6: finding sample mean y given x1bar, x2bar and MLR
b0 = 3.9
b1 = 1.9
b2 = -.5
x1 = 7.9
x2 = 3.7
b0 + b1 * x1 + b2 * x2

# 8: 
vote1$totexpend = vote1$expendA + vote1$expendB
reg3 = lm(voteA ~ expendA + expendB + totexpend, data = vote1)
b4 = reg3$coefficients[4]
b4

# 11: finding MLR slope given b1, b2, delta
b1tidle = .73
b2hat = 1.23
delta1tidle = -.33
b1hat = b1tidle - b2hat * delta1tidle
b1hat

# 12: finding slope of cigs on bwght
reg4 = lm(bwght ~ cigs, data = bwght)
bcigs = reg4$coefficients[2]
bcigs

# 13: slope on cigs, holding faminc fixed
reg5 = lm(bwght ~ cigs + faminc, data = bwght)
bcigsMLR = reg5$coefficients[2]
bcigsMLR

# 14: finding b2hat * delta1tidle
reg6 = lm(faminc ~ cigs, data = bwght)
delta1 = reg6$coefficients[2]
bfamincMLR = reg5$coefficients[3]
bfamincMLR * delta1
