#Go to the Making inference page - this first section is referring to book
#Define inference first in class and then with the group.
#Do not use the textbook when going over this.  Use the Script below as your guide

#Hypothesis Testing
#a.	Type I error vs Type II error – Give an example (Flip flops vs medicine)
#b.	Type I error = Level of significance = 1 – level of confidence
#c.	Type II errors  and Power
#d.	Sufficient evidence – not proof
#e.	P-value need two things: a test statistic and a sampling dist of test stat

#Find the four parametric distributions
#(types of tests that are run on each test from 221)

#Parametric methods compared to non-parametric methods
#non parametric test are still powerful and are likely more powerful 
#than parametric tests if the requirements for a parametric test are not met. 
library(mosaic)
#An example of doing a t.test
t.test(KidsFeet$length, mu=25.1, alternative="two.sided",conf.level=0.95)
#Ho: mu=25.1 Ha:mu ne 25.1
#level of signficance = 0.05
#Test Statistic t=-1.7865 df=38 p=value = 0.082
#p-value > alpha, therefore we fail to reject the Ho
#We have insufficient evidence to say that the mean is different than 25.1.

pander(t.test(KidsFeet$length, mu=25.1, alternative="less",conf.level=0.95))
#Ho: mu=25.1 Ha:mu < 25.1
#level of signficance = 0.05
#Test Statistic t=-1.7865 df=38 p=value = 0.041
#p-value < alpha, therefore we reject the Ho
#We have sufficient evidence to say that the mean is less than 25.1.

#Note: Because of the Central Limit Theorem, we can assume the distribution
#of sample means is normal because we have a large sample size (n>=30).

library(mosaic)
t.test(length~sex,data=KidsFeet, mu=0, alternative = "greater",conf.level=0.95)
