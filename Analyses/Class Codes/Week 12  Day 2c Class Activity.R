#1)
# Be sure to set up path appropriately based on where the GSS 2021 data is and where this script is
# and set working directory to source file location.  If you use this code exactly, save
# this script file  in the Analysis folder

install.packages("rio") 
library(rio)
GSS2021 <- rio::import("../../Data/gss2021.sas7bdat")
library(tidyverse)
glimpse(GSS2021)
#there will be a warning about multiple files, that's fine


#2)	
#use the names function to list the column names in the data
names(GSS2021)
#Go to the website to get info on each of the variable names:
#https://sda.berkeley.edu/sdaweb/analysis/?dataset=gss21 (For the 2021 data)

#You can put any of the names in the "selected" box on the top left of the website
#to see what the variable is and how people responded to the survey

#Finally, after finding the variables you want, you can do an analysis with 
#either two variables in the same year or the #same variable for both years.
#The example below cover two variables in one year.

#2b)Filtered out the levels of each variable you are interested in 
#e.g. 8s and 9s and other items to be removed.
#2c) Used mutate to have good names the categories
library(mosaic)
GSS2021c <- GSS2021 %>%
  filter(OWNGUN %in% c(1,2), GOD %in% c(1,2,3,4,5,6)) %>%
  mutate(OWNGUN1 = case_when(
    OWNGUN == 1 ~ "YES",
    OWNGUN == 2 ~ "NO"
  ),
  GOD1 = case_when(
    GOD == 1 ~ "don't believe",
    GOD == 2 ~ "don't know, no way to find out",
    GOD == 3 ~ "higher power",
    GOD == 4 ~ "believe sometimes",
    GOD == 5 ~ "believe with doubts",
    GOD == 6 ~ "no doubts"
  ))
colnames(gss2021)

#3)table(GSS2012$nameOfColumn1)
GODTABLE <- table(GSS2021c$GOD1)
GODTABLE

#4)table(GSS2012$nameOfColumn2)
GUNTABLE <- table(GSS2021c$OWNGUN1)
GUNTABLE

#5)table(GSS2012$nameOfColumn1, GSS2012$nameOfColumn2)
GODGUNTABLE <- table(GSS2021c$OWNGUN1,GSS2021c$GOD1)
GODGUNTABLE

#6)	Turn the three tables into barplots
barplot(GODTABLE)
barplot(GUNTABLE)
barplot(GODGUNTABLE, beside=TRUE, 
        col=c("red","green"),legend.text=TRUE,
        args.legend = list(x="topleft",bty="y",title="Do You Own A Gun?"),
xlab="Do Believe in God?",main="GUN OWNERSHIP AND BELIEF IN GOD")


#7)	Run a chi-square test on the two columns
godgunchi <- chisq.test(GODGUNTABLE)
library(pander)
pander(godgunchi)

#8)	Check the requirements 
pander(godgunchi$expected)
mean(godgunchi$expected)

#9)	Do mychisq$residuals and talk it out with a person
pander(godgunchi$residuals)

