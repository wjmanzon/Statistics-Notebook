#Find the ANOVA using Statistics Notebook
#Compare the difference between t-test, ANOVA using
#the index.html file
#Go through the Overview, Explanation, and Instructions in the Textbook
View(airquality)
#Using the Airquality data - Define Factor and Level of a Factor
#State briefly that we will cover two-way ANOVA next week
library(pander)
library(mosaic)
library(tidyverse)

#Use the Airquality Example
#Numerical and Graphical Summary

boxplot(Wind~Month,data=airquality)
ggplot(data=airquality, aes(x=as.factor(Month), y=Wind))+
  geom_boxplot(fill=c("blue","red","yellow","green","purple"))
pander(favstats(Wind~Month,data=airquality))
#Analysis - One Way ANOVA
airq.aov <- aov(Wind~as.factor(Month),data=airquality)
pander(summary(airq.aov))
#Checking Requirements
par(mfrow=c(1,2))
plot(airq.aov,which=1:2)

par(mfrow=c(1,1))
1#Use the Chickwt Example
#Null and alternative hypotheses
#$$ H_0:\mu_1 = \mu_2 = \mu_3 = \mu_4 = \mu_5 = \mu_6 $$
#$$ H_a: \text{at least one } \mu \text{ is different} $$
  
#Numerical and Graphical Summary
boxplot(weight~feed,data=chickwts)
ggplot(data=chickwts, aes(y=weight, x=feed))+
  geom_boxplot(fill = c("blue","white","green","yellow","orange","brown"))

xyplot(weight ~ feed, data=chickwts,
main="Experiment on how Feed Type impacts Chicken Growth",
ylab="Adult Weight of Chickens (in grams)",
xlab="Type of Feed Chickens were Fed \n 
(Blue line shows average weights per feed type.)", type=c("p","a"))

pander(favstats(weight~feed,data=chickwts)[,c("feed","mean","sd","n")])
#Analysis - One Way ANOVA
chickwt.aov <- aov(weight~feed,data=chickwts)
pander(summary(chickwt.aov))
#Checking Requirements
par(mfrow=c(1,2))
plot(chickwt.aov,which=1:2)

#warpbreaks dataset. 

#Question - Are each of the two factors signficant and do they interaction
#with each other
#Null and alternative hypotheses
#The First set of null and alternative hypotheses are listed for each factor
  $$ H_0:\mu_1 = \mu_2 = \mu_3 =\mu \text{for tension}$$
  $$ H_a: \text{at least one } \mu \text{ is different for tension} $$
  $$ H_0:\mu_1 = \mu_2 = \mu \text{for wool}$$
  $$ H_a: \text{at least one } \mu \text{ is different for wool} $$
  $$ H_0:\text{ The effect of tension is the same for all types of wool} $$
  $$ H_a:\text{ The effect of tension is not the same for all types of wool}$$
  install.packages("lattice")
library(lattice)
library(tidyverse)
library(mosaic)
library(pander)
#Numerical Summaries
warpbreaks %>% 
  group_by(tension) %>% 
  summarise(ave=mean(breaks),sd=sd(breaks),SampleSize=n()) %>% pander()

warpbreaks %>% 
  group_by(wool) %>% 
  summarise(ave=mean(breaks),sd=sd(breaks),SampleSize=n()) %>% pander()

warpbreaks %>% 
  group_by(wool, tension) %>% 
  summarise(ave=mean(breaks),sd=sd(breaks),SampleSize=n()) %>% pander()

library(mosaic)
library(pander)
favstats(breaks~wool+tension,data=warpbreaks)
#Graphical Summaries xyplots 3 plots
xyplot(breaks ~ wool, data=warpbreaks, type=c("p","a"),
       main="Type of Wool", col='blue', 
       xlab="Type of Wool", ylab="Number of Warps that Broke")
xyplot(breaks ~ tension, data=warpbreaks, type=c("p","a"),
       main="Type of Tension", col='blue', 
       xlab="Type of Tension", ylab="Number of Warps that Broke")
xyplot(breaks ~ tension, data=warpbreaks, groups=wool, type=c("p","a"), 
       main="Significance of the Interaction",
       auto.key=list(corner=c(1,1)))

## Inferential Statistics
warp.aov <- aov(breaks ~ wool + tension + wool:tension, data=warpbreaks)
summary(warp.aov) %>% pander()
par(mfrow=c(1,2))
plot(warp.aov, which=1:2, pch=16)
