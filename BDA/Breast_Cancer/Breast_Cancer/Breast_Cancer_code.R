## install packages
packages <- c("rpart", "rattle", "rpart.plot", "RColorBrewer", "magrittr")
for (i in packages){
  install.packages(i)
}
## library
sapply(packages, FUN = library, character.only = TRUE)

## Load data
path = 'd:/R/Breast_Cancer/beast_cancer_dataset.csv'
data <- read.csv(path)
#資料清洗
data <- data %>% na.omit
data_factor <- data

#把診斷的B和M轉換成1/0
data_factor$diagnosis[data_factor$diagnosis == "B"] <- 0
data_factor$diagnosis[data_factor$diagnosis == "M"] <- 1
data_factor

#Check the dimensionality
dim(data)
#Variable names or column names
names(data)
#Structure
str(data)
#Attributes
attributes(data)

#把資料集分為mean、se、worst三大類別
data_factor_mean = data_factor[2:12]
diagnosis = data_factor[2]
bind_se = data_factor[13:22]
data_factor_se = merge(diagnosis, bind_se)
bind_worst = data_factor[23:32]
data_factor_worst = merge(diagnosis, bind_worst)

#針對mean、se、worst三大類別跑顯著性
lm_mean <- lm(formula = diagnosis~., data=data_factor_mean)
summary(lm_mean)
lm_se <- lm(formula = diagnosis~., data=data_factor_se)
summary(lm_se)
lm_worst <- lm(formula = diagnosis~., data=data_factor_worst)
summary(lm_worst)

data_mean <- data[, -c(13:33)] %>% na.omit

##k-means
newdata <- data_mean
newdata$diagnosis <- NULL
(kc <- kmeans(newdata,2))
table(data_mean$diagnosis)
table(kc$cluster)
table(data_mean$diagnosis,kc$cluster)
plot(newdata[c("concave.points_mean","area_mean","radius_mean","texture_mean")],col=kc$cluster)
points(kc$centers[,c("concave.points_mean","area_mean","radius_mean","texture_mean")],col=c(1,2),pch=8,cex=3)

n<-nrow(data_mean)
# 隨機排列資料集
set.seed(123) 
#set a random seed, so that sample() results will be the same everytime.
shuffledData <- data_mean[sample(n), ]   #sample: random select

# 將資料集分為訓練與測試
##訓練集 - 取資料集前7成
trainIndices <- 1:round(0.7 * n)
train <- shuffledData[trainIndices, ]
##測試集 - 取資料集後3成
testIndices <- (round(0.7 * n) + 1):n
test <- shuffledData[testIndices, ]

# 建立一個決策樹模型
##生存率對其他因子
##訓練模型
tree <- rpart(formula = diagnosis ~ ., data = data_mean, method = "class")
##模型測試
prediction <- predict(tree, newdata = test, type="class")
fancyRpartPlot(tree)

#混淆矩陣
confusionMatrix <- table(x = test$diagnosis, y = prediction, dnn=c("Actual", "Prediction"))
confusionMatrix

#箱型圖 - 可看出是否有離群值
box_info <- boxplot(concave.points_mean ~ diagnosis ,data = data)
box_info <- boxplot(area_mean ~ diagnosis ,data = data)
box_info <- boxplot(radius_mean ~ diagnosis ,data = data)
box_info <- boxplot(texture_mean ~ diagnosis ,data = data)
