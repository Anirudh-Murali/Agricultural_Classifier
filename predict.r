setwd("/media/alfred/Stuff/Projects/Sahil ka hackathon")
install.packages("e1071")
install.packages("caret")
install.packages("Amelia")
library(Amelia)

training.data.raw <- read.csv('train.csv',header=T,na.strings=c(""))

#to check missing values
sapply(training.data.raw,function(x) sum(is.na(x)))
missmap(training.data.raw, main = "Missing values vs observed")

########Cleaning up the data set
training.data <- training.data.raw[!is.na(training.data.raw$Production),]
 i <- 0L
 
while(i < 242361)
  {
    training.data[i,6] <- (training.data[i,6]/training.data[i,5])
    i <- i + 1
}
training.data <- training.data[,-5]
#####Splitting Training Set
#i <- 1L
#j <- 1L

#while(i < 33) 
 # if(training.data[j,1] == training.data[j+1,1])
  #subsets[i,]  

model <- glm(Crop ~.,family=binomial(link='logit'),data=training.data)
 
 
 