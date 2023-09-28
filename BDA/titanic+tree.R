# 載入需要的套件
install.packages("magrittr")
install.packages("rpart")
library(magrittr)
library(rpart)
# 讀取資料
titanic <- read.csv("c:/train.csv", header = TRUE)
str(titanic)
mytitanic <- titanic[, c(2, 3, 5, 6)] %>% na.omit
mytitanic$Survived <- factor(mytitanic$Survived, levels = c(1, 0))
str(mytitanic)

# 建立一個決策樹模型
set.seed(123)
treeModel <- rpart(Survived ~ ., data = mytitanic, method = "class")
titanicToBePredicted <- mytitanic[, -1]
prediction <- predict(treeModel, newdata = titanicToBePredicted, type = "class")

# 將混淆矩陣印出來
confusionMatrix <- table(mytitanic$Survived, prediction, dnn = c("Actual", "Predicted"))
confusionMatrix

# 獲得TP, TN, FP, FN
TP <- confusionMatrix[1, 1]
TN <- confusionMatrix[2, 2]
FP <- confusionMatrix[2, 1]
FN <- confusionMatrix[1, 2]
# 計算accuracy, TPR, FPR

accuracy1 <- (TP + TN)/(TP + TN + FP + FN)
accuracy2 <- sum(diag(confusionMatrix))/sum(confusionMatrix)# 試試這樣算

#敏感度 Sensitivity
TPR <- TP/(TP + FN)
TPR
#特異度 Specificity
TNR <- TN/(FP + TN)
TNR
#False Postive Rate
FPR <- FP/(FP + TN)
FPR
#False Negative Rate
FNR <- FN/(TP + FN)
FNR
# accuracy, TPR, FPR
accuracy1
accuracy2
