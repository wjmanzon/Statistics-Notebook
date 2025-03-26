#Open your Statistics Notebook with Kruskal Wallis Page
#Start with Overview - Similarities and Differennces Between Kruskal-Wallis and Wilcoxon Rank Sum Test
#Hypotheses for Kruskal-Wallis
#Go through explanation of Calculating of Test Statistic - Briefly show the six steps – in the explanation
#Go through one of the examples

#What can you conclude with a p-value from a Kruskal Wallis
#Kruskal-Wallis Test and Wilcoxon Rank Sum test – Multiple samples and not just two – plus it is the non-parametric version of ANOVA
#Hypotheses

#Kruskal Wallis – go through a few examples below and in the end explain what three codes they need for Kruskal Wallis

library(mosaic)
library(pander)
library(car)
library(tidyverse)

par(mfrow=c(1,1))
boxplot(correct ~ condition, data=Friendly, col='grey', ylab="# of Correct Answers", main="# of Correct Answers by Method", xlab="Method")
ggplot(data=Friendly, aes(x=condition, y=correct))+
  geom_boxplot(fill=c("red","white","blue"))

favstats(correct ~ condition, data=Friendly)[,-10] %>%pander(caption="# of Correct Answers by Method")
sharky.aov <- aov(correct ~ condition,data=Friendly)
summary(sharky.aov)
#Checking Requirements
par(mfrow=c(1,2))
plot(sharky.aov,which=1)
qqPlot(sharky.aov$residuals)
kruskal.test(correct ~ condition, data=Friendly)

#Use the Chickwt Example
#Numerical and Graphical Summary
par(mfrow=c(1,1))
boxplot(weight~feed,data=chickwts)
ggplot(data=chickwts, aes(x=feed, y=weight))+
  geom_boxplot(fill=c("red","white","blue","red","white","blue"))
pander(favstats(weight~feed,data=chickwts))
#Analysis - One Way ANOVA
chickwt.aov <- aov(weight~feed,data=chickwts)
summary(chickwt.aov)
#Checking Requirements
par(mfrow=c(1,2))
plot(chickwt.aov,which=1)
qqPlot(sharky.aov$residuals)
#Analysis - Kruskal Wallis
kruskal.test(weight~feed,data=chickwts)
