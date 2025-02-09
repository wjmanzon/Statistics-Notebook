#Use library function for mosaic and pander and then view functions on KidsFeet
#before getting started
library(tidyverse)
library(mosaic)
library(pander)


#2)	Have students go through an explanation of what they see in Overview, 
#R instructions, and Explanations.

#One sample t test
pander(t.test(KidsFeet$length, mu=28, alternative="two.sided",conf.level=0.95))
#Ho: mu = 28 Ha: mu ne 28
# $$ H_o: \mu=28 H_a:\mu \neq 28 $$
#level of signficance = 0.05 ($$ \alpha $$)
#Test Statistic t=-15.532 df=38 p=value < 2.2e-16
#p-value < alpha, therefore we reject the Ho
#We have sufficient evidence to say that the mean is different than 28.

#Note: Because of the Central Limit Theorem, we can assume the distribution
#of sample means is normal because we have a large sample size (n>30).

#Paired t test
library(tidyverse)
KidsFeet3 <- KidsFeet %>% 
  mutate(width3 = 3*width,difference = length -width3) 

t.test(KidsFeet3$length, KidsFeet3$width3, mu=0, paired=TRUE,
       alternative="two.sided",conf.level=0.95)

t.test(KidsFeet3$difference, mu=0, 
       alternative="two.sided",conf.level=0.95)

#Ho: mu_d = 0 Ha: mu_d ne 0
# $$ H_o: \mu_d = 0 H_a:\mu_d \neq 0 $$
#level of signficance = 0.05 ($$ \alpha $$)
#t = -11.529, df = 38, p-value = 5.668e-14
#p-value < alpha, therefore we reject the Ho
#We have sufficient evidence to say that there is a difference between
#width*3 and length.
  
#Note: Because of the Central Limit Theorem, we can assume the distribution
#of sample means is normal because we have a large sample size (n>30).
  
#Indepdendent Samples t test
t.test(length~sex, mu=0, data=KidsFeet, alternative="two.sided",
       conf.level=0.95)
#Ho: mu_boy = mu_girl Ha: mu_boy = mu_girl
# $$ H_o: \mu_boy = \mu_girl H_a:\mu_boy \neq \mu_girl $$
#level of signficance = 0.05 ($$ \alpha $$)
#t = 1.9174, df = 36.275, p-value = 0.06308
#p-value > alpha, therefore we fail to reject the Ho
#We have *insufficient evidence to say that the length is different
#between boys and girls.
  
#Note: Because of the Central Limit Theorem, we can assume the distribution
#of sample means is normal because we have a large sample size (n>30).

#Checking requirements
library(car)
#One Sample t test
qqPlot(KidsFeet$length)
#Paired t test
qqPlot(KidsFeet3$length-KidsFeet3$width3)
#Independent Samples t test
qqPlot(length~sex,data=KidsFeet)

#Graphics
#One Sample t test
boxplot(KidsFeet$length)
ggplot(data=KidsFeet, aes(x=length))+
  geom_boxplot(fill="blue")
# Paired t test
boxplot(KidsFeet3$length-KidsFeet3$width3)
ggplot(data=KidsFeet3, aes(x=difference))+
  geom_boxplot(fill="blue")
#Independent Samples t test
boxplot(length~sex,data=KidsFeet)
ggplot(data=KidsFeet, aes(y=length, x=sex))+
  geom_boxplot(fill=c("blue","pink"))

#Numerical Summaries
#One Sample t test
pander(favstats(KidsFeet$length))
# Paired t test
pander(favstats(KidsFeet3$length-KidsFeet3$width3))
#Independent Samples t test
pander(favstats(length~sex,data=KidsFeet))

#Put some notes within the the index rmd file