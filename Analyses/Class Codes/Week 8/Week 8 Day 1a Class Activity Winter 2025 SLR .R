# 1) Students are to find some data to do a simple linear regression for Friday
#Need to find two quantitative variables to determine a linear relationship
# 2) Predicted final exam score

#3) Regression Applet
#a) Move the sliders on the right - What does "a" represent and what does "b" represent
#a.	Height to Shoe Size
#b.	Move sliders and a and b to try and fit the data.
#c.	Best fit and compare to your line
#d.	Residuals – squared residuals

#4)	Discuss with neighbor and then with group
#a.	Changing a? – Explaining the slope

#Talk from Elder Gilbert
# a) What does least squares regression line mean?

# Open your Statistics-Notebook to the Linear Regression page.
#Overview of Simple Linear Regression
#R instructions for Simple Linear Regression and finding the y-intercept and slope
#First one section of Explanation tab
# c. Residual and Errors


#Sample Code for Simple Linear Regression

#Get a Data Set
#Assumptions
#Review some of the explanations
library(car)
library(DT)
library(tidyverse)
library(pander)
library(mosaic)
#rm("Davis")
## $$ Y_i = \beta_0 +  \beta_1x_i + \epsilon $$
## $$ H_0: \beta_1 = 0 $$
## $$ H_a: \beta_1 \neq 0 $$

##Data Set 1


Davis2 <- Davis %>%
  filter(height>140)

predict(davis.lm, newdata = data.frame(repht = 160), type = "response")


davis.lm <- lm(height ~ repht, data = Davis2)
summary(davis.lm)


plot(height ~ repht, data = Davis2)
abline(davis.lm,lty=1,lwd=1)
library(tidyverse)
ggplot(Davis2, aes(x = repht, y = height))+
  geom_point()+
  geom_smooth(method = "lm", formula = y~x, se = FALSE)

DavisNA <- Davis2 %>%
  filter(!is.na(repht),!is.na(height))
cor(DavisNA$height,DavisNA$repht)

par(mfrow=c(1,3))
plot(davis.lm,which=1)
library(car)
qqPlot(davis.lm$residuals)
plot(davis.lm$residuals)

##Data Set 2
kidsfeet.lm <- lm(length ~ width, data = KidsFeet)
summary(kidsfeet.lm)

plot(length ~ width, data = KidsFeet)
abline(kidsfeet.lm,lty=1,lwd=1)
ggplot(KidsFeet, aes(x = width, y = length))+
  geom_point()+
  geom_smooth(method = "lm", formula = y~x, se = FALSE)

cor(KidsFeet$length,KidsFeet$width)

par(mfrow=c(1,3))
plot(kidsfeet.lm,which=1:2)
plot(kidsfeet.lm$residuals)

#You should leave class having been introduced to the following.
#Have students talk with at least one other person.

#The Mathematical Model of Regression (including the equation of the best-fit line).
#How to interpret the slope and intercept in a Simple Linear Regression.
#What a residual is in a regression.
#How to measure the correlation of a regression.
#How to diagnose the appropriateness of a regression for a given data set.
#How to perform a regression in RStudio and locate the slope and intercept from the output summary.
