#Day 1
# A) Quantitative vs Categorical Data - KidsFeet
# B) Statistics-Notebook page - Identify columns where a dataset would match
#"data logos"
# One Quantitative Response Variable Y - length
# Quantitative Y | Categorical X (2 Groups) - length by sex
# Quantitative Y | Categorical X (3+ Groups) - Nothing in the data with 3+ groups
# Quantitative Y | Multiple Categorical X length by sex and biggerfoot
# Quantitative Y | Quantitative X - length and width
# Quantitative Y | Multiple X  - length and width and sex
# Binomial Y | Quantitative X - sex and length - opposite x and y 
# Binomial Y | Multiple X - Don't worry about it
# Categorical Y | Categorical X - biggerfoot and domhand

#C - table - categorical
table(KidsFeet$biggerfoot, KidsFeet$domhand)
# group_by() - categorical
#summarise() - quantiative
KidsFeet %>% 
  group_by(sex) %>% 
  summarise(mean_length = mean(length))
#D
# Histogram - quantitative
# Boxplot - quantitative
# Dot plot - quantitative
# Scatterplot - quantitative
# Bar plot - categorical

#E - If there is time, try some of the plots in R
library(mosaic)
library(tidyverse)
library(pander)
View(KidsFeet)
## Identify the (1) type of data, (2) R Commands, and (3) Graphic that
## could be used to answer each of the following questions.

## How many boys (B) and how many girls (G) are in the KidsFeet dataset?
#(1) type of data - sex (categorical)
#(2 & 3) table and barplot
table(KidsFeet$sex)

barplot(table(KidsFeet$sex))

## What is the average length of feet in the KidsFeet dataset?
#(1) type of data - length (quantitative)
#(2 & 3) favstats and boxplots
favstats(KidsFeet$length) %>% pander()

boxplot(KidsFeet$length, main="Length of Kids Feet")

ggplot(data=KidsFeet, aes(x=length)) +
  geom_boxplot(fill="navy")+
  labs(
    x="Length of Kids Feet"
  )

## Do boys (B) or girls (G) have longer feet, on average, in the KidsFeet
##dataset?
#(1) type of data - length (quantitative) and sex (categorical)
#(2 & 3) favstats and boxplots
favstats(length~sex,data=KidsFeet) %>% pander()

boxplot(length~sex,data=KidsFeet, main="Comparing Length of Feet Across Gender", 
        xlab="Gender",ylab="Length of Foot",col=c("blue","pink"))

ggplot(KidsFeet, aes(x=sex, y=length,fill=sex)) +
  geom_boxplot()+
  labs(title = "Comparing Length of Feet Across Gender",
       x="Gender",
       y="Length of Foot")+
  scale_fill_manual(values=c("blue","pink"))

## Are there certain months of the year that are associated with children
## having longer feet, on average, than others?
#(1) type of data - length (quantitative) and month (categorical)
#(2 & 3) favstats and boxplots
favstats(length~birthmonth,data=KidsFeet) %>% pander()

boxplot(length~birthmonth,data=KidsFeet, col="navy",
        xlab = "Numerical Birth Month", ylab="Feet Length")

ggplot(data=KidsFeet, aes(x=as.factor(birthmonth), y=length)) +
  geom_boxplot(fill="navy")+
  labs(
    x="Numerical Birth Month",
    y="Foot Length"
  )

## Is there a relationship between the length of children's feet and the
## width of their foot?
#(1) type of data - length and width (quantitative)
#(2 & 3) correlation and plot

cor(KidsFeet$length,KidsFeet$width)

plot(length~width, data=KidsFeet, main = "Relationship Between Length and 
     Width of Kids Feet", xlab="Width of Foot", ylab = "Length of Foot")

ggplot(KidsFeet,aes(x=width,y=length))+
  geom_point(color="navy")+
  labs(
    title="Relationship Between Length and Width of Kids Feet",
    x="Width of Foot",
    y="Length of Foot")

ggplot(KidsFeet,aes(x=width,y=length,color=sex))+
  geom_point()+
  labs(title="Relationship Between Length and Width of Kids Feet", 
       x="Width of Foot", 
       y="Length of Foot")+
  scale_color_manual(values=c("blue","pink"))

## Does the width of a child's foot predict whether or not they are
## right-handed?
## Logistic Regression - Will Cover later

## Is one gender more likely to be born in certain seasons of the year?
#(1) type of data - season and sex (categorical)
#(2 & 3) table and bar plot

Kids3 <- KidsFeet %>% 
  mutate(
    season = case_when(
      birthmonth %in% c(12,1,2) ~ "Winter",
      birthmonth %in% c(3,4,5) ~ "Spring",
      birthmonth %in% c(6,7,8) ~ "Summer",
      birthmonth %in% c(9,10,11) ~ "Fall"
    )
  )  

pander(table(Kids3$season,KidsFeet$sex))

barplot(table(Kids3$sex, Kids3$season),beside = TRUE,
        col = c("blue","pink"),legend.text=TRUE, 
        xlab="Handedness", ylab="Frequency", main="Count of Gender by Season")

ggplot(Kids3,aes(x=season,fill=sex))+
  geom_bar(position="dodge")+
  scale_fill_manual(values=c("blue","pink"))


#Make some notes in your index file and knit.



