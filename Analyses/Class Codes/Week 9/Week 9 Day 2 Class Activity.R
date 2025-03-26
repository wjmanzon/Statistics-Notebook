#1)	Each student draw a sketch of the two-line model and explain to one other person
#2) LaTex code for the model and null and alternative hypotheses
$$
  Y_i = \beta_0 + \beta_1{X_{i1}} + \beta_2{X_{i2}} + \beta_3{x_{i1}}{x_{i2}} + \epsilon_i
$$
$$ H_0: \beta_1 = 0 $$
$$ H_a: \beta_1 \neq 0 $$
$$ H_0: \beta_2 = 0 $$
$$ H_a: \beta_2 \neq 0 $$
$$ H_0: \beta_3 = 0 $$
$$ H_a: \beta_3 \neq 0 $$
#2) Go through one example of the three and then have them try the other two:

#Equal slopes

par(mfrow=c(1,1))
palette(c("skyblue","firebrick"))
plot(mpg ~ qsec, data=mtcars, col=as.factor(am), xlim=c(0,30), ylim=c(-30,40), main="1974 Motor Trend Cars", pch=16)
equalslopes.lm <- lm(mpg~qsec + as.factor(am), data=mtcars)
summary(equalslopes.lm)
b <- coef(equalslopes.lm)
b
abline( b[1], b[2], col=palette()[1])
abline( b[1]+b[3],b[2], col=palette()[2])
legend("topleft", legend=c("automatic","manual"), pch=1, col=palette(), title="Transmission (am)", bty="n")
#Note:  You may need to increase the graph window so the legend is in the right place.

#Equal intercepts

palette(c("skyblue","firebrick"))
plot(mpg ~ qsec, data=mtcars, col=as.factor(am), xlim=c(0,30), ylim=c(-30,40), main="1974 Motor Trend Cars", pch=16)
equalint.lm <- lm(mpg~qsec + qsec:as.factor(am), data=mtcars)
summary(equalint.lm)
b <- coef(equalint.lm)
abline( b[1], b[2], col=palette()[1])
abline( b[1],b[2]+b[3], col=palette()[2])
legend("topleft", legend=c("automatic","manual"), pch=1, col=palette(), title="Transmission (am)", bty="n")

#Full Model

palette(c("skyblue","firebrick"))
plot(mpg ~ qsec, data=mtcars, col=as.factor(am), xlim=c(0,30), ylim=c(-30,40), main="1974 Motor Trend Cars", pch=16)
fullmodel.lm <- lm(mpg~qsec + as.factor(am) + as.factor(am):qsec, data=mtcars)
summary(fullmodel.lm)
b <- coef(fullmodel.lm)
abline( b[1], b[2], col=palette()[1])
abline( b[1]+b[3],b[2]+b[4], col=palette()[2])
legend("topleft", legend=c("automatic","manual"), pch=1, col=palette(), title="Transmission (am)", bty="n")

#Summarize your Findings
#What have you learned? Discuss the following with your peers as you complete this activity.

#Are all p-values significant in your lm(...) for the full model?
  
#How about for the equal intercepts model?
  
#How about for the equal slopes model?