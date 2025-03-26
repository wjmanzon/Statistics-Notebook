#1)	Open statistics notebook
#2)	Go through the combine function in the textbook
Fruitrow <- rbind( Apples = c(Good = 80, Bruised = 20, Rotten = 15), 
                   Oranges = c(Good = 75, Bruised = 25, Rotten = 10) )
Fruitrow
#          Good Bruised Rotten
#Apples    80      20     15
#Oranges   75      25     10
Fruitcolumn <- cbind( Apples = c(Good = 80, Bruised = 20, Rotten = 15), Oranges = c(Good = 75, Bruised = 25, Rotten = 10) )
Fruitcolumn
#         Apples Oranges
#Good        80      75
#Bruised     20      25
#Rotten      15      10
#5)	Go through an example of a barplot
#6)	Note: Rows are legends, and columns are columns or bars
barplot(Fruitrow,beside = TRUE, legend.text=TRUE)
barplot(Fruitcolumn,beside = TRUE, legend.text=TRUE)
# 9) Using data
table(mtcars$am, mtcars$cyl)
library(tidyverse)
ggplot(data=mtcars,aes(x=as.factor(cyl),fill=as.factor(am)))+
  geom_bar(stat = "count",position = position_dodge())+
  scale_fill_manual(values = c("red","green"))+
  labs(
    x="cylinder",
    fill="Transmission",
    y="Number of Cars"
  )
#10) Using data
barplot(table(mtcars$am, mtcars$cyl), beside=TRUE, 
        col=c("red","green"), legend.text=TRUE, xlab="Cylinders")
#Doing chisq analysis – chisq.test(x) using both data
Fruitchi <- chisq.test(Fruitcolumn)
Fruitchi
mtchi <- chisq.test(table(mtcars$am, mtcars$cyl))
mtchi
#12)	Check the requirements using mychisq$expected and mean(mychisq$expected) for both data
Fruitchi$expected
#             Good Bruised   Rotten
#Apples  79.22222      23 12.77778
#Oranges 75.77778      22 12.22222 
mtchi$expected
#       4       6      8
#0 6.53125 4.15625 8.3125
#1 4.46875 2.84375 5.6875
mean(mtchi$expected)
#[1] 5.333333
#13)	Do Pearsons residuals on both data – mychisq$residuals
Fruitchi$residuals
mtchi$residuals
