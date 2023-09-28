packages <- c("rpart", "rattle", "rpart.plot", "RColorBrewer", "magrittr")
for (i in packages){
  install.packages(i)
}
sapply(packages, FUN = library, character.only = TRUE)
# install.packages()
# library()
titanic <- read.csv("d:/cyhsu/Rcb1507/train.csv", header = TRUE)
titanic <- titanic[, -c(4, 9, 11)] %>% na.omit
# magrittr 套件中最重要的功能就是 %>% 管線運算子，
# 它的作用在於將左側的運算結果傳遞至右側函數的第一個參數
# 請參考https://blog.gtwang.org/r/r-pipes-magrittr-package/

str(titanic)
n<-nrow(titanic)
# 隨機排列資料集
set.seed(123) 
#set a random seed, so that sample() results will be the same everytime.
shuffledTitanic <- titanic[sample(n), ]   #sample: random select

# 將資料集分為訓練與測試
trainIndices <- 1:round(0.7 * n)
train <- shuffledTitanic[trainIndices, ]
testIndices <- (round(0.7 * n) + 1):n
test <- shuffledTitanic[testIndices, ]

# 建立一個決策樹模型
tree <- rpart(formula = Survived ~ ., data = train, method = "class")
prediction <- predict(tree, newdata = test, type="class")
fancyRpartPlot(tree)

confusionMatrix <- table(x = test$Survived, y = prediction, dnn=c("Actual", "Prediction"))
confusionMatrix
##       Prediction
## Actual   0   1
##      0 117   7
##      1  38  52