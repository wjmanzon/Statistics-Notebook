#Day 1
# A) Take a few moments to knit your index.rmd file
# B) Do the Good Graphics question in the quiz
library(mosaic)
library(tidyverse)

View(airquality)
?airquality

#Histograms (length)
hist(airquality$Wind,main="La Guardia Airport from May to September, 1973", 
     xlab="Daily Average Wind Speeds (mph)",ylab="Frequency",col="steelblue",breaks = 22)

ggplot(airquality,aes(x=Wind))+
  geom_histogram(fill="steelblue")+
  labs(title="La Guardia Airport from May to September, 1973",
       x="Daily Average Wind Speeds (mph)",
       y="Frequency")

## go through the four questions below for QUestion 3

##25

#boxplots
boxplot(Wind~Month,main="Wind by Month", xlab="Month",
     ylab="Wind",col=c("steelblue1", "steelblue2", "steelblue3","steelblue3",
                       "steelblue2"),data=airquality)

ggplot(data=airquality,aes(y=Wind,x=Month,group=Month))+
  geom_boxplot(fill=c("steelblue1", "steelblue2", "steelblue3","steelblue3",
                      "steelblue2"))+
  labs(title = "Wind by Month",
       y="Wind",
       x="Month")


#scatterplots 

plot(Ozone~Temp,data=airquality,main="Relationship Between Ozone and Temperature",
     xlab="Temp", ylab="Ozone",pch = 19, col="blue")

ggplot(airquality,aes(x=Temp,y=Ozone))+
  geom_point(color="blue")+
  labs(title="Relationship Between Ozone and Temperature", 
       x="Temp", 
       y="Ozone")


## Go over the Stephanie analysis



