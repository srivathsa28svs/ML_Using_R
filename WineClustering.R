wine2 <- read.csv(file = "F:/9408623-b237fa5848349a14a14e5d4107dc7897c21951f5/wine.csv", header = TRUE, sep = ",")

winef = wine2

winef$Wine <- NULL

winef

winestd <- scale(winef[-1])
winestd

results <- kmeans(winestd,3)
results

attributes(results)


table(wine2$Wine,results$cluster)