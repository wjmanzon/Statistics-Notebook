#Any questions about the assignment last week
#Remind students of peer feedback by Tuesday night
#Go through the explanation of the five steps of doing the Wilcoxon signed-rank
#test in the textbook

#Example
library(mosaic)
library(car)
t.test(KidsFeet$length, mu=25)
qqPlot(KidsFeet$length)
wilcox.test(KidsFeet$length, mu=25)

#Ho: median = 25
#Ha: median ne 25
#What does the alternative hypothesis means?
#alternative hypothesis: true location shift is not equal to 0

#Go through the explanation of the five steps of doing the Wilcoxon ranked-sum
#test (Mann-Whitney) in the textbook
t.test(length ~ sex, data=KidsFeet)
wilcox.test(length ~ sex, data=KidsFeet)

#The test is negatively affected when there are ties (repeated values) present
#in the data, but the results are still useful if there are relatively few ties.