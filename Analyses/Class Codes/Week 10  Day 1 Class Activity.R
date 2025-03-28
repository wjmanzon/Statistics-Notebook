#Open Challenger example and see if you can watch a few minutes from the video
#Look at the second paragraph on how the data was collected
#Then go to the explanation of the logistic model and explain
#a.	The model
#b.	The log of the odds
install.packages("alr4")
library(alr4)
library(mosaic)
library(DT)
library(tidyverse)
library(pander)



chall.glm <- glm(fail>0 ~ temp, data=Challeng, family=binomial)
summary(chall.glm) %>% pander()

#Plotting the model
plot( fail>0 ~ temp, data=Challeng, 
      xlab="Outside Temperature at Time of Launch (Fahrenheit)",
      col = c("green","red")[as.factor(fail>0)],
      ylab='Probability of At least One O-ring Failing', pch=16, 
      main="NASA Shuttle Launch Data from 1981 to 1985", xlim=c(30,85))

#Getting the coeffiencts
b <- coef(chall.glm)
b
curve(exp(b[1]+b[2]*x)/(1+exp(b[1]+b[2]*x)), add=TRUE)
#Testing the fit of the model
install.packages("ResourceSelection")
library(ResourceSelection)
library(tidyverse)
library(pander)
hoslem.test(chall.glm$y, chall.glm$fitted, g=6) %>% pander()
#If multiple repeated x values then use the following:
pchisq(20.32, 21, lower.tail=FALSE)

#Prediciting a failure based on a temperature: 
predict(chall.glm, newdata = data.frame(temp = 64.75), type = "response")
#0.9996088

#Interpreting exp(b1) shows that the odds of the o-rings failing for a given
#launch decreases by a factor of 0.79 for every 1° F increase in temperature.
#Said differently, the odds of an o-ring failure during launch decrease by 21% (1-0.79)
#for every 1° F increase in temperature. (Also, from the reverse perspective,
#every 1° F decrease in temperature increases the odds of a failed o-ring by a factor of
exp(-0.2322)
exp(b[2])
#0.79

#Add some notes to your Table of Contents about logistic regression.

#Things to do Further:
# 1) Probability on y-axis
# 2) Binomial is using logit equation
# 3) Checking requirements
# 4) Explain of each of the items in the equation mean

crime.lm <- lm(crimerate ~ exams, data=andrew)
summary(crime.lm)
crime.glm <- glm((crimerate > 210.5)~exames, data=andrew, family=binomial)
summary(crime.glm)
