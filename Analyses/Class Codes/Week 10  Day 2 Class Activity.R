#WAIT TO ADD THIS WITHIN THE COURSE
#Work on the KidsFeet Data
#Do the model: 
kidsfeet.glm <- glm(sex=="B" ~ length, data=KidsFeet, family=binomial)
summary(kidsfeet.glm)
#Plotting the model
plot( sex=="B" ~ length, data=KidsFeet, xlab="Length",
      col = c("red","lightblue")[as.factor(sex=="B")],
      ylab="Probability of of a Child being a Boy", pch=16, 
      main="KidsFeet Logistic Regression")
b <- coef(kidsfeet.glm)
b
library(ResourceSelection)
library(tidyverse)
library(pander)
curve(exp(b[1]+b[2]*x)/(1+exp(b[1]+b[2]*x)), add=TRUE)
hoslem.test(kidsfeet.glm$y, kidsfeet.glm$fitted, g=6) %>% pander()
#Predict 
predict(kidsfeet.glm, newdata = data.frame(length = 25), type = "response")
#Calculating odds
exp(b[2])
#1.660921
#Interpreting
#If beta1 is significant then the explanatory variable does well in predicting 
#the odds of a “success”.  But interpreting e(b1) is more important.  
#As the length of a foot in cm goes up by one, the odds of the child being a boy
#increases by a factor of 0.66 or 66%. 
