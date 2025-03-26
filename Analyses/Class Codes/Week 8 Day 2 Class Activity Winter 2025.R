#Go through the four questions in the class quiz with at least one other
#person and use the simple linear regression section within the textbook
#You can use the code below to practice items with a simple linear regression.

#KidsFeet Data Analysis
library(car)
library(DT)
library(tidyverse)
library(pander)
library(mosaic)
$$ Y_i = \beta_0 +  \beta_1x_i + \epsilon $$
$$ H_0: \beta_1 = 0 $$
$$ H_a: \beta_1 \neq 0 $$
kidsfeet.lm <- lm(length ~ width, data = KidsFeet)
summary(kidsfeet.lm)

plot(length ~ width, data = KidsFeet)
abline(kidsfeet.lm,lty=1,lwd=1)
ggplot(KidsFeet, aes(x = width, y = length))+
  geom_point()+
  geom_smooth(method = "lm", formula = y~x, se = FALSE)

par(mfrow=c(1,3))
plot(kidsfeet.lm,which=1:2)
plot(kidsfeet.lm$residuals)


