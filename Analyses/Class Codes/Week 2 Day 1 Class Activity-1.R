# 1) Go to the Analysis Menu and open Good Example Analysis
# 2) Summary of Student Peer Reviews for the Good Example Analysis
# 3) Identify at least one student who you would like feedback from
# 4) Identify at least one Student that you would NOT like to give you feedback 
#    on future assignments.
# 5) Find an example of Good Specific Feedback - 
# To practice, locate at least one student feedback where the feedback
# is specific enough that if it were given to the wrong student
# that student wouldn't find it useful, but the right student would find it useful.
# 6) With Peers, identify things you should avoid doing
# 7) With Peers, identify principles that would make for a good critique
library(mosaic)
library(pander)
library(tidyverse)
View(KidsFeet)

#Group 1

boxplot(length~sex,data=KidsFeet)

KidsFeet %>% 
  group_by(sex) %>% 
  summarise(min = min(length), Q1=quantile(length,0.25), median=median(length),Q3=quantile(length,0.75),
            max=max(length))

favstats(length~sex,data=KidsFeet)
#Group 2

barplot(table(KidsFeet$sex))

table(KidsFeet$sex)

#Group 3

plot(length~width, data=KidsFeet)
       
KidsFeet %>% 
  summarise(Correlation=cor(width,length))


#Add any notes to your Index file in the Statistics Notebook