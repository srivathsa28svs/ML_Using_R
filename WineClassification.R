install.packages("party")
library(party)
wine2 <- read.csv(file = "F:/9408623-b237fa5848349a14a14e5d4107dc7897c21951f5/wine.csv", header = TRUE, sep = ",")


#ind <- sample(2,nrow(wine2),replace=TRUE,prob=c(0.7,0.3))

#train.data <- wine2[ind==1,]
#test.data <- wine2[ind==2,]

ind <- sample.split(wine2, SplitRatio = 0.80)
train.data <- subset(wine2, ind == T)
test.data <- subset(wine2, ind == F)

myf <- Wine ~ Alcohol+Malic.acid+Ash+Flavanoids+Mg

wine_ctree <- ctree(myf, data= train.data)

#table(predict(wine_ctree),train.data$Wine)

plot(wine_ctree)

testpred <- predict(wine_ctree, newdata= test.data)

table(testpred, test.data$Wine)