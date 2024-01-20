temperature <- c(29, 28, 34, 31, 25, 29, 32, 31, 24, 33, 25, 31, 26, 30)
icedTeaSales <- c(77, 62, 93, 84, 59, 64, 80, 75, 58, 91, 51, 73, 65, 84)
#sweetness <- c(19, 12, 18, 12, 11, 15, 16, 12, 11, 20, 12, 11, 13, 19)

toBePredicted <- data.frame(temperature = 30)
#toBePredicted <- data.frame(temperature = c(28,30), sweetness=c(12.5, 18.5))
icedTeaData <- data.frame(temperature = temperature, icedTeaSales = icedTeaSales)
lmIcedTea <- lm(formula = icedTeaSales ~ temperature, data = icedTeaData)

#icedTeaData <- data.frame(temperature = temperature, icedTeaSales = icedTeaSales, sweetness=sweetness)
#lmIcedTea <- lm(formula = icedTeaSales ~ temperature+sweetness, data = icedTeaData)

predicted <- predict(lmIcedTea, newdata = toBePredicted)
summary(lmIcedTea)
plot(icedTeaSales ~ temperature, main = "依據氣溫預測冰紅茶銷量", xlab = "當日最高氣溫(度)", ylab = "冰紅茶銷量(杯)", family = "STHeiti")
points(x = toBePredicted$temperature, y = predicted, col="green", cex = 2, pch = 18)
abline(reg = lmIcedTea$coefficients, col = "red", lwd = 2)

#plot 3D
#install.packages("plotly")
#library(plotly)
#plot_ly(icedTeaData, x=sweetness, y=temperature, z=icedTeaSales)


#kmeans
irisCluster <- iris[-5]
kmeansIris <- kmeans(irisCluster, centers = 3, nstart = 10)
# 作圖
plot(formula = Petal.Length ~ Petal.Width, data = irisCluster, col = kmeansIris$cluster, main = "將鳶尾花做分群", xlab = "花瓣寬度", ylab = "花瓣長度", family = "STHeiti")

#plot(irisCluster[c("Sepal.Length", "Sepal.Width")], col=kmeansIris$cluster)
#points(kmeansIris$centers[,c("Sepal.Length", "Sepal.Width")], col=1:3, pch=8, cex=2)

plot(irisCluster[c("Petal.Length", "Petal.Width")], col=kmeansIris$cluster)
points(kmeansIris$centers[,c("Petal.Length", "Petal.Width")], col=1:3, pch=8, cex=2)

table(kmeansIris$cluster, iris$Species)
ggplot(iris, aes(Petal.Length, Petal.Width, color = iris$Species)) +
  geom_point(alpha = 0.4, size = 3.5) + geom_point(col = kmeansIris$cluster) +
  scale_color_manual(values = c('black','red','green'))

#k 要怎麼選擇 - Hands on
ratio_ss <- rep(NA, times = 11)
for (k in 1:length(ratio_ss)) {
  fit_km <- kmeans(irisCluster, centers=k, nstart=20)
  #ratio_ss[k] <- fit_km$tot.withinss/fit_km$totss
  ratio_ss[k] <- fit_km$betweenss/fit_km$totss
}
plot(ratio_ss, type="b", xlab="k", main = "screeplot") # "b" as in both

#------
library(magrittr)
library(rpart)

packages <- c("rpart", "rattle", "rpart.plot", "RColorBrewer", "magrittr")
for (i in packages){
  install.packages(i)
}
sapply(packages, FUN = library, character.only = TRUE)

# 讀取資料
titanic <- read.csv("e:/cyhsu/Rcb1507/train.csv", header = TRUE)
#titanic2 <- titanic[, c(2, 3, 5, 6)] %>% na.omit
titanic2 <- titanic[, -c(4, 9, 11, 12)] %>% na.omit
#titanic2$Survived <- factor(titanic2$Survived, levels = c(1, 0))
str(titanic2)


# 建立一個決策樹模型
n <- nrow(titanic2)  #
set.seed(123)  #set a random seed, so that sample() results will be the same everytime.
shuffledTitanic <- titanic2[sample(n), ]   #sample: random select

# 將資料集分為訓練與測試
trainIndices <- 1:round(0.7 * n)
train <- shuffledTitanic[trainIndices, ]
testIndices <- (round(0.7 * n) + 1):n
test <- shuffledTitanic[testIndices, ]

treeModel <- rpart(formula = Survived ~ ., data = train, method = "class")
#titanicToBePredicted <- titanic2[, -1]

prediction <- predict(treeModel, newdata = test, type = "class")
fancyRpartPlot(treeModel)

# 將混淆矩陣印出來
confusionMatrix <- table(x=test$Survived, y=prediction, dnn = c("Actual", "Predicted"))
confusionMatrix


# 獲得TP, TN, FP, FN
TP <- confusionMatrix[1, 1]
TN <- confusionMatrix[2, 2]
FP <- confusionMatrix[2, 1]
FN <- confusionMatrix[1, 2]

# 計算accuracy, TPR, FPR
accuracy <- (TP + TN)/(TP + TN + FP + FN)
accuracy <- sum(diag(confusionMatrix))/sum(confusionMatrix)# 試試這樣算
TPR <- TP/(TP + FN)
FPR <- FP/(FP + TN)

# accuracy, TPR, FPR
accuracy

TPR
## [1] 0.8
FPR
## [1] 0.125


# 氣溫與冰紅茶銷量
temperature <- c(29, 28, 34, 31, 25, 29, 32, 31, 24, 33, 25, 31, 26, 30)
icedTeaSales <- c(77, 62, 93, 84, 59, 64, 80, 75, 58, 91, 51, 73, 65, 84)
icedTeaData <- data.frame(temperature, icedTeaSales)

# 建立一個線性迴歸模型
lmFit <- lm(formula = icedTeaSales ~ temperature, data = icedTeaData)
icedTeaDataToBePredicted <- data.frame(icedTeaData[, -2])
prediction <- predict(lmFit, newdata = icedTeaDataToBePredicted)
RMSE <- sqrt(sum( (icedTeaData$icedTeaSales - prediction) ^ 2) / nrow(icedTeaData))
RMSE

#練習
airUCI <- read.csv("d:/airUCI.csv", header = FALSE, col.names = c("freq", "angle", "chLength", "velocity", "thickness", "dec"))
lmFit <- lm(formula = dec ~ freq + chLength + angle, data = airUCI)

# 直接從UCI讀入資料集
airUCI <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/00291/airfoil_self_noise.dat", header = FALSE, col.names = c("freq", "angle", "chLength", "velocity", "thickness", "dec"))
# 建立一個線性模型lmFit_1, 用練習題規定的三個變數預測dec
lmFit_1 <- lm(formula = dec ~ freq + angle + chLength, data = airUCI)
# 將原始資料的三個變數篩選出
airUCIToBePredicted <- data.frame(airUCI[, c(1:3)])
# 用建好的模型預測dec
prediction <- predict(lmFit_1, newdata = airUCIToBePredicted)
# 再利用公式計算預測趨勢線與實際值的的RMSE
RMSE1 <- sqrt(sum( (airUCI$dec - prediction) ^ 2) / nrow(airUCI))
RMSE1
## [1] 5.215778

temperature <- c(29, 28, 34, 31, 25, 29, 32, 31, 24, 33, 25, 31, 26, 30)
icedTeaSales <- c(77, 62, 93, 84, 59, 64, 80, 75, 58, 91, 51, 73, 65, 84)
icedTeaData <- data.frame(temperature, icedTeaSales)
lmFit <- lm(formula = icedTeaSales ~ temperature, data = icedTeaData)
icedTeaSalesEst <- predict(lmFit, newdata = data.frame(icedTeaData[, 1]))
RMSE <- sqrt(sum( (icedTeaData$icedTeaSales - prediction) ^ 2) / nrow(icedTeaData))
RMSE

# 計算R-squared
res <- icedTeaData$icedTeaSales - icedTeaSalesEst
ss_res <- sum (res ^ 2)
ss_tot <- sum( (icedTeaData$icedTeaSales - mean(icedTeaData$icedTeaSales))^2 )
r_sq <- 1 - ss_res / ss_tot
r_sq
## [1] 0.8225093
# 跟 summary() 的結果比較
summary(lmFit)$r.squared
## [1] 0.8225093


#WSS / TSS 比例
str(iris)
# 建立一個分群模型
irisCluster <- iris[-5]
kmeansIris<-kmeans(irisCluster, centers = 3)

# 作圖
plot(formula = Petal.Length ~ Petal.Width, data = irisCluster, col = kmeansIris$cluster, main = "將鳶尾花做分群", xlab = "花瓣寬度", ylab = "花瓣長度", family = "STHeiti")
# 計算WSS/TSS的比例
WSS <- kmeansIris$tot.withinss
BSS <- kmeansIris$betweenss
ratio <- WSS/(WSS + BSS)
ratio
## [1] 0.1157247

seedsUCI <- read.csv("d:/seedsUCI.csv", header = FALSE, col.names = c("area", "perimeter", "compactness", "length", "width", "asymmetry", "grooveLength", "type"))
seedsUCIToBeClustered <- seedsUCI[, -8]
kmeansseeds<-kmeans(seedsUCIToBeClustered, centers = 3)
# 作圖
plot(formula = area ~ perimeter, data= seedsUCIToBeClustered, col = kmeansseeds$cluster, main = "分群", xlab = "perimeter", ylab = "area", family = "STHeiti")
# 計算WSS/TSS的比例
WSS <- kmeansseeds$tot.withinss
BSS <- kmeansseeds$betweenss
ratio <- WSS/(WSS + BSS)
ratio

# 倒帳資料集
debtIncomeRatio <- c(1, 2.112, 4.123, 1.863, 2.973, 1.687, 5.891, 3.167, 1.23, 2.441, 3.555, 3.25, 1.333)
default <- c(0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1)
defaultDataTrain <- data.frame(debtIncomeRatio, default)
defaultDataTrain$default <- factor(defaultDataTrain$default)

# 分類器
default_classifier <- function(x){
  prediction <- rep(NA, length(x))
  prediction[x > 4] <- 1
  prediction[x >= 3 & x <= 4] <- 0
  prediction[x >= 2.2 & x < 3] <- 1
  prediction[x >= 1.4 & x < 2.2] <- 0
  prediction[x > 1.25 & x < 1.4] <- 1
  prediction[x <= 1.25] <- 0
  return(prediction)
}

# training資料集的accuracy
defaultPredictionOverTrain <- default_classifier(defaultDataTrain$debtIncomeRatio)
confusionMatrixOverTrain <- table(defaultDataTrain$default, defaultPredictionOverTrain)
accuracyOverTrain <- sum(diag(confusionMatrixOverTrain)) / sum(confusionMatrixOverTrain)
accuracyOverTrain
## [1] 1
# test資料集
debtIncomeRatio <- c(1.5,   4.941,  3.429,  3.493,  3.38,   3.689,  1,  6.761,  2.195,  2.857,  1.883,  1.744,  2.325,  1.25,   1.8,    2.5,    4.617,  2.206,  8.323,  3.764,  1.932,  3.153,  1.983,  3.812,  4.295,  4.5,    1.3,    1,  5.009,  5.888,  1,  3.456,  3.379,  1.755,  2.333,  2.188,  1.406,  1.857,  3.707,  3.766,  2.93,   2.076,  1.9,    1.684,  2.769,  4.571,  3.029,  3.628)
default <- c(0,     1,  1,  1,  0,  1,  0,  1,  1,  0,  0,  0,  0,  0,  1,  0,  1,  0,  1,  0,  0,  0,  0,  1,  0,  1,  0,  0,  1,  0,  0,  1,  0,  0,  0,  0,  0,  0,  1,  0,  1,  0,  0,  1,  1,  0,  0,  0)
defaultDataTest <- data.frame(debtIncomeRatio, default)
defaultDataTest$default <- as.factor(defaultDataTest$default)

# test資料集的accuracy
defaultPredictionOverTest <- default_classifier(defaultDataTest$debtIncomeRatio)
confusionMatrixOverTest <- table(defaultDataTest$default, defaultPredictionOverTest)
accuracyOverTest <- sum(diag(confusionMatrixOverTest)) / sum(confusionMatrixOverTest)
accuracyOverTest
## [1] 0.625

# 新的分類器
default_classifier <- function(x){
  prediction <- rep(NA, length(x))
  prediction[x > 4] <- 1
  prediction[x <= 4] <- 0
  return(prediction)
}

###### new 3rd PPT
library(rpart)
library(rattle)
## Rattle: A free graphical interface for data mining with R.
## Version 4.1.0 Copyright (c) 2006-2015 Togaware Pty Ltd.
## Type 'rattle()' to shake, rattle, and roll your data.
library(rpart.plot)
library(RColorBrewer)
library(magrittr)

# 載入titanic資料集
titanic <- read.csv("d:/train.csv", header = TRUE)
titanic <- titanic[, c(2, 3, 5, 6)] %>% na.omit
titanic$Survived <- factor(titanic$Survived, levels = c("1", "0"))
titanic$Pclass <- factor(titanic$Pclass)

# 建立訓練與測試樣本
n <- nrow(titanic)
set.seed(123)
shuffledTitanic <- titanic[sample(n), ]
trainIndices <- 1:round(0.7 * n)
train <- shuffledTitanic[trainIndices, ]
testIndices <- (round(0.7 * n) + 1):n
test <- shuffledTitanic[testIndices, ]

# 建立決策樹模型
tree <- rpart(Survived ~ ., data = train, method = "class")

# 畫決策樹
fancyRpartPlot(tree)

# 預測測試樣本
prediction <- predict(tree, test, type = "class")

# 計算accuracy
confusionMatrix <- table(test$Survived, prediction)
accuracy <- sum(diag(confusionMatrix)) / sum(confusionMatrix)
accuracy


titanic <- read.csv("/Users/tkuo/ntu_train/NTUTrainRL3/data/train.csv", header = TRUE)
titanic <- titanic[, c(2, 3, 6)] %>% na.omit
titanic$Survived <- factor(titanic$Survived, levels = c("1", "0"))

# 標準化Pclass
minPclass <- min(titanic$Pclass)
maxPclass <- max(titanic$Pclass)
titanic$Pclass <- (titanic$Pclass - minPclass) / (maxPclass - minPclass)
#Knn
# 切分訓練測試樣本
set.seed(123)
n <- nrow(titanic)
shuffledTitanic <- titanic[sample(n), ]
trainIndices <- 1:round(0.7 * n)
train <- shuffledTitanic[trainIndices, ]
testIndices <- (round(0.7 * n) + 1):n
test <- shuffledTitanic[testIndices, ]

# 先將標準答案獨立出來
trainLabels <- train$Survived
testLabels <- test$Survived

# 獨立預測變數
knnTrain <- train[, -c(1)]
knnTest <- test[, -c(1)]

# 建立模型
library(class)
set.seed(123)
pred <- knn(train=knnTrain, test=knnTest, cl=trainLabels, k=5)

#如何選擇 k 值? - Hands on
range <- 1:round(0.2 * nrow(knnTrain))
accuracies <- rep(NA, length(range))
set.seed(123)

for (i in range) {
  prediction <- knn(train = knnTrain, test = knnTest, cl = trainLabels, k = i)
  confusionMatrix <- table(testLabels, prediction)
  accuracies[i] <- sum(diag(confusionMatrix))/sum(confusionMatrix)
}

plot(range, accuracies, xlab="k")

which.max(accuracies)
## [1] 1

# 建立訓練與測試樣本
set.seed(123)
n <- nrow(titanic)
shuffledTitanic <- titanic[sample(n), ]
trainIndices <- 1:round(0.7 * n)
train <- shuffledTitanic[trainIndices, ]
testIndices <- (round(0.7 * n) + 1):n
test <- shuffledTitanic[testIndices, ]

# ROC Curve
library(rpart)
set.seed(123)
tree <- rpart(Survived ~ ., train, method = "class")
probabilities <- predict(tree, test, type = "prob")[,1]
library(ROCR)
## Loading required package: gplots
## 
## Attaching package: 'gplots'
## The following object is masked from 'package:stats':
## 
##     lowess
pred <- prediction(probabilities, labels = test$Survived)
perf <- performance(pred, "tpr", "fpr")
# 執行正常但是不能knit
plot(perf)

# AUC
perf <- performance(pred, "auc")
perf@y.values[[1]]
## [1] 0.7163082

#用AUC比較模型 - Hands on
# 載入titanic資料集
#titanic <- read.csv("/Users/tkuo/ntu_train/NTUTrainRL3/data/train.csv", header = TRUE)
titanic <- read.csv("d:/train.csv", header = TRUE)
titanic <- titanic[, -c(1, 4, 9)] %>% na.omit
titanic$Survived <- factor(titanic$Survived, levels = c("1", "0"))
titanic$Pclass <- factor(titanic$Pclass)

# 建立訓練與測試樣本
n <- nrow(titanic)
set.seed(123)
shuffledTitanic <- titanic[sample(n), ]
trainIndices <- 1:round(0.7 * n)
trainComp <- shuffledTitanic[trainIndices, ]
testIndices <- (round(0.7 * n) + 1):n
testComp <- shuffledTitanic[testIndices, ]

# ROC Curve
set.seed(123)
treeComp <- rpart(Survived ~ ., trainComp, method = "class")
probabilitiesComp <- predict(treeComp, testComp, type = "prob")[,1]
predComp <- prediction(probabilitiesComp, labels = testComp$Survived)
perfComp <- performance(predComp, "tpr", "fpr")
# 執行正常但是不能knit
plot(perf, main = "ROC Curves", col = "blue", lwd = 2)
plot(perfComp, add = TRUE, col = "green", lwd = 2)


#NEW PPT
temperature <- c(29, 28, 34, 31, 25, 29, 32, 31, 24, 33, 25, 31, 26, 30)
icedTeaSales <- c(77, 62, 93, 84, 59, 64, 80, 75, 58, 91, 51, 73, 65, 84)
plot(x = temperature, y = icedTeaSales, col = "red", pch = 16)

#什麼是最fit的線 - Hands on
#使用 lm() 函數來為你做好這些事情
#在 R Console 輸入 ?lm 來看看這個函數
icedTeaData <- data.frame(temperature = temperature, icedTeaSales = icedTeaSales)
lmIcedTea <- lm(formula = icedTeaSales ~ temperature, data = icedTeaData)
lmIcedTea$coefficients
## (Intercept) temperature 
##  -36.361233    3.737885
toBePredicted <- data.frame(temperature = 30)
predicted <- predict(lmIcedTea, newdata = toBePredicted)
predicted
##        1 
## 75.77533

cars <- cars
plot(x = cars$speed, y = cars$dist, col = "red", pch = 16)
lmCars <- lm(formula = dist ~ speed, data = cars)
toBePredicted <- data.frame(speed=26)
prediction <- predict(lmCars, newdata = toBePredicted)
prediction
## 1 
## 84.66353
carsSpeed <- data.frame(cars$speed)
names(carsSpeed) <- "speed"
carsEst <- predict(lmCars, newdata = carsSpeed)
# 計算RMSE
res <- cars$dist - carsEst
rmse <- sqrt( sum(res^2) /nrow(cars) )
rmse
# 計算R???squared
ss_res <- sum (res ^ 2)
ss_tot <- sum( (cars$dist - mean(cars$dist))^2 )
r_sq <- 1 - ss_res / ss_tot
r_sq
# 跟 summary() 的結果比較
summary(lmCars)$r.squared

#我們改用 chocolate.csv 資料集練習
chocolate <- read.csv("e:/cyhsu/R_training_2016_2/data/chocolate.csv")
par(mfrow=c(1, 2))
plot(calories ~ protein, chocolate)
plot(calories ~ fat, chocolate)

# 單變數
chocoSingleVar <- lm(formula = calories ~ protein, data = chocolate)
summary(chocoSingleVar)$r.squared
## [1] 0.4944082
# 雙變數 # 多納入脂肪含量使模型的R平方增加到接近0.9
chocoTwoVars <- lm(formula = calories ~ protein + fat, data = chocolate)
summary(chocoTwoVars)$adj.r.squared
## [1] 0.8945784

# 加入更多的變數 - Do It Yourself
#將熱量對大小 size 作圖
#將 size 也納入
par(mfrow=c(1, 3))
plot(calories ~ protein, chocolate)
plot(calories ~ fat, chocolate)
plot(calories ~ size, chocolate)
chocoThreeVars <- lm(formula = calories ~ protein + fat +size, data = chocolate)
summary(chocoThreeVars)
summary(chocoThreeVars)$adj.r.squared

#單變數/多變數線性模型需要符合的假設
chocoLm <- lm(formula = calories ~ ., data = chocolate)
par(mfrow=c(1, 2))
plot(x = chocoLm$fitted.values, y = chocoLm$residuals)
qqnorm(chocoLm$residuals)

#X與Y不是單調的關係
#我們試圖要用國內生產毛額 gdp 來預測城市居住人口比例 urban_pop
worldBankDat <- read.csv("e:/cyhsu/R_training_2016_2/data/urbanPopGdp.csv", header = TRUE)
plot(x = worldBankDat$gdp, y = worldBankDat$urb_pop)
lmNonTransformed <- lm(formula = urb_pop ~ gdp, data = worldBankDat)
summary(lmNonTransformed)$r.squared
#X與Y不是線性關係
# 做個log轉換吧
plot(worldBankDat$urb_pop, log(worldBankDat$gdp))
lmLogTransformed <- lm(formula = urb_pop ~ log(gdp), data = worldBankDat)
summary(lmLogTransformed)$r.squared

#GAM
library(mgcv)
fit_gam <- gam(formula = urb_pop ~ s(gdp), data = worldBankDat)
summary(fit_gam)
par(mfrow=c(1, 1))
plot(x = worldBankDat$gdp, y = worldBankDat$urb_pop)
x <- seq(0, 100000, length = 100)
y <- predict(fit_gam, data.frame(gdp = x))
lines(x, y, col = "red", lwd = 2)


#PPT 5th
iris_km <- iris[, -5]
set.seed(123)
fit_km <- kmeans(iris_km, nstart=20, centers=3)
table(fit_km$cluster, iris[, 5])
##    
##     setosa versicolor virginica
##   1     50          0         0
##   2      0          2        36
##   3      0         48        14
plot(iris_km$Petal.Width, iris_km$Petal.Length, col=fit_km$cluster)

ratio_ss <- rep(NA, times = 11)
for (k in 1:length(ratio_ss)) {
  fit_km <- kmeans(iris_km, centers=k, nstart=20)
  ratio_ss[k] <- fit_km$tot.withinss/fit_km$totss
}
plot(ratio_ss, type="b", xlab="k", main = "screeplot") # "b" as in both


#唐恩指數愈高, 分群的效果愈好
#使用 clValid 套件中的 dunn() 函數
library(clValid)
## package: clvalid
## Loading required package: cluster
iris_km <- iris[, -5]
set.seed(123)
fit_km <- kmeans(iris_km, nstart=20, centers=3)
dunn(clusters = fit_km$cluster, Data = iris_km)
## [1] 0.09880739

#正規化 - Hands on
mtcars_km <- mtcars
fit_km <- kmeans(mtcars_km, centers = 5, nstart = 10)
mtcars_km_norm <- data.frame(scale(mtcars))
fit_km_norm <- kmeans(mtcars_km_norm, centers = 5, nstart = 10)
# 比較兩個唐恩指數
dunn(clusters = fit_km$cluster, Data = mtcars_km)
## [1] 0.1743059
dunn(clusters = fit_km_norm$cluster, Data = mtcars_km_norm)
## [1] 0.6849157


#然後使用 hclust() 函數建模
crime_data <- read.csv("d:/crime_data.csv")
crime_data_num <- crime_data[, c(-1:-2)]
row.names(crime_data_num) <- crime_data[, 1]
dist_matrix <- dist(crime_data_num)
crime_single <- hclust(dist_matrix, method = "single")
crime_single_hclust <- cutree(crime_single, k = 4)
plot(crime_single)
rect.hclust(tree=crime_single, k=4)
dunn(clusters = crime_single_hclust, Data = crime_data_num)
## [1] 0.1071949

