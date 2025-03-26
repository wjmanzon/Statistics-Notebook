#Go through the example using the two line model.- see the teaching notes and Elder Gilbert's talk
#1)	State the mathematical equation of two-line model
#2) lm.2lines <-lm(mpg ~ qsec + am + qsec:am, data=mtcars) -  
#   Use the example in the textbook to go through what the estimates mean:
#3)	Interpret the intercept and slope of each of the two lines (the answer is below)
#4)	Create a scatterplot using the code below

lm.2lines <-lm(mpg ~ qsec + am + qsec:am, data=mtcars)
summary(lm.2lines)

lm.2lines <-lm(mpg ~ qsec*am, data=mtcars)
summary(lm.2lines)

lm.line <-lm(mpg ~ qsec, data=mtcars)
summary(lm.line)

#Create graph using the following code:

plot(mpg ~ qsec, data=mtcars, col=c("blue","red")[as.factor(am)],pch=16, 
bg="gray83", main="Two-lines Model using mtcars data set", cex.main=1)
legend("topleft", legend=c("Baseline (am==0)", "Changed-line (am==1)"), 
bty="n", lty=1, col=c("blue","red"), cex=0.8)

#get the "Estimates" automatically:
# Then b will have 4 estimates:
# b[1] is the estimate of beta_0: -9.0099
# b[2] is the estimate of beta_1:  1.4385
# b[3] is the estimate of beta_2: -14.5107
# b[4] is the estimate of beta_3: 1.3214
b <- coef(lm.2lines)
curve(b[1] + b[2]*x, col="blue", lwd=2, add=TRUE)  #baseline (in blue)
curve((b[1] + b[3]) + (b[2] + b[4])*x, col="red", lwd=2, add=TRUE) #changed line (in orange)
b
b <- coef(lm.2lines)
b
# Then b will have 4 estimates:
# b[1] is the estimate of beta_0: -9.0099
# b[2] is the estimate of beta_1:  1.4385
# b[3] is the estimate of beta_2: -14.5107
# b[4] is the estimate of beta_3: 1.3214
library(tidyverse)
ggplot(mtcars, aes(y=mpg, x=qsec, color=factor(am))) +
  geom_point(pch=16) +
  #geom_smooth(method="lm", se=F) + #easy way, but only draws the full interaction model. The manual way using stat_function (see below) is more involved, but more dynamic.
  stat_function(fun = function(x) b[1] + b[2]*x, color="red") + #am==0 line
  stat_function(fun = function(x) (b[1]+b[3]) + (b[2]+b[4])*x,color="yellow") + #am==1 line 
  scale_color_manual(name="Transmission (am)", values=c("red","yellow")) +
  labs(title="Two-lines Model using mtcars data set")

library(tidyverse)
ggplot(mtcars, aes(y=mpg, x=qsec, color=factor(am))) +
  geom_point(pch=16, bg="gray83") +
  geom_smooth(method="lm", se=F) + #easy way, but only draws the full interaction model. The manual way using stat_function (see below) is more involved, but more dynamic.
  scale_color_manual(name="Transmission (am)", values=c("red","yellow")) +
  labs(title="Two-lines Model using mtcars data set")


#Check the requirements to see if the model is good
par(mfrow=c(1,3))
plot(lm.2lines,which=1)
library(car)
qqPlot(lm.2lines$residuals)
plot(lm.2lines$residuals)

#Check for significance
#qsec is significant  and the change of slope is significant
