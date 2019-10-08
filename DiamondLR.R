diamonds <- read.csv(file = "F:/diamonds.csv", header=TRUE, sep=",")


op <- par(mfrow=c(1,3))

boxplot(diamonds$carat,main="carat")
boxplot(diamonds$depth,main="depth")
boxplot(diamonds$price,main="price")

library(caTools)
splitDF <- sample.split(diamonds$price, SplitRatio = 0.80)
trainingSet <- subset(diamonds, splitDF==T)
testSet <- subset(diamonds,splitDF==F)

#Model train and test
trainedModel <- lm(price~.,data = trainingSet)
finalResult <- predict(trainedModel, testSet)
finalData <- cbind(actual = testSet$price, predicted = finalResult)
finalData <- as.data.frame(finalData)
finalData
trainedModel


errorRate <- (finalData$actual - finalData$predicted)
cbind(finalData,errorRate)->finalData
errorMean<-sqrt(mean(finalData$errorRate^2))
errorMean

#new prediction
newdata<-data.frame(carat=0.23,cut='Good',color='F',clarity='VS1', depth=58.2, table=59.0, x=4.06, y=4.08, z=2.37)
predict(trainedModel, newdata)