## Load data
path = 'd:/rtemp/Breast_Cancer/beast_cancer_dataset.csv'
data <- read.csv(path)
data

# data preview
# 檢視資料結構
str(data)

# 摘要統計
summary(data)

head(data,5)
tail(data,5)


install.packages("caTools")

set.seed(123) # 設置種子以確保結果可重複
library(caTools)
split = sample.split(data$diagnosis, SplitRatio = 0.7)
train_data = subset(data, split == TRUE)
test_data = subset(data, split == FALSE)

# Assuming "data" is your dataset and "diagnosis" is the target variable
library(rpart)  # Load the decision tree library

# Create and train a decision tree model
model <- rpart(diagnosis ~ ., data = train_data, method = "class")
# Create a plot for the decision tree
plot(model);text(model) 

install.packages("rpart.plot")
library(rpart.plot)
prp(model,faclen=0,fallen.leaves=TRUE,shadow.col="gray",extra=2,cex = 1)

install.packages("partykit")
library(partykit)
plot(as.party(model),cex = 1)  

install.packages("rattle")
library(rattle)
fancyRpartPlot(model,sub = "",cex = 1) 

# Make predictions on the test data
predictions <- predict(model, test_data, type = "class")

# Ensure the "diagnosis" variable in test_data is a factor with levels "B" and "M"
test_data$diagnosis <- factor(test_data$diagnosis, levels = levels(predictions))

# Evaluate the model's performance
install.packages("caret")
library(caret)
confusion_matrix <- confusionMatrix(predictions, test_data$diagnosis)
print(confusion_matrix)

# plot confusion matrix
draw_confusion_matrix(confusion_matrix)

conf_matrix_table <- confusion_matrix$table
fourfoldplot(conf_matrix_table, color = c("#CC6666", "#99CC99"),
             conf.level = 0, margin = 1, main = "Confusion Matrix")


draw_confusion_matrix <- function(cm) {
  
  layout(matrix(c(1,1,2)))
  par(mar=c(2,2,2,2))
  plot(c(100, 345), c(300, 450), type = "n", xlab="", ylab="", xaxt='n', yaxt='n')
  title('CONFUSION MATRIX', cex.main=2)
  
  # create the matrix 
  rect(150, 430, 240, 370, col='#3F97D0')
  text(195, 435, 'Non-COVID-19', cex=1.2)
  rect(250, 430, 340, 370, col='#F7AD50')
  text(295, 435, 'COVID-19', cex=1.2)
  text(125, 370, 'Predicted', cex=1.3, srt=90, font=2)
  text(245, 450, 'Actual', cex=1.3, font=2)
  rect(150, 305, 240, 365, col='#F7AD50')
  rect(250, 305, 340, 365, col='#3F97D0')
  text(140, 400, 'Non-COVID-19', cex=1.2, srt=90)
  text(140, 335, 'COVID-19', cex=1.2, srt=90)
  
  # add in the cm results 
  res <- as.numeric(cm$table)
  text(195, 400, res[1], cex=1.6, font=2, col='white')
  text(195, 335, res[2], cex=1.6, font=2, col='white')
  text(295, 400, res[3], cex=1.6, font=2, col='white')
  text(295, 335, res[4], cex=1.6, font=2, col='white')
  
  # add in the specifics 
  plot(c(100, 0), c(100, 0), type = "n", xlab="", ylab="", main = "DETAILS", xaxt='n', yaxt='n')
  text(10, 85, names(cm$byClass[1]), cex=1.2, font=2)
  text(10, 70, round(as.numeric(cm$byClass[1]), 3), cex=1.2)
  text(30, 85, names(cm$byClass[2]), cex=1.2, font=2)
  text(30, 70, round(as.numeric(cm$byClass[2]), 3), cex=1.2)
  text(50, 85, names(cm$byClass[5]), cex=1.2, font=2)
  text(50, 70, round(as.numeric(cm$byClass[5]), 3), cex=1.2)
  text(70, 85, names(cm$byClass[6]), cex=1.2, font=2)
  text(70, 70, round(as.numeric(cm$byClass[6]), 3), cex=1.2)
  text(90, 85, names(cm$byClass[7]), cex=1.2, font=2)
  text(90, 70, round(as.numeric(cm$byClass[7]), 3), cex=1.2)
  
  # add in the accuracy information 
  text(30, 35, names(cm$overall[1]), cex=1.5, font=2)
  text(30, 20, round(as.numeric(cm$overall[1]), 3), cex=1.4)
  text(70, 35, names(cm$overall[2]), cex=1.5, font=2)
  text(70, 20, round(as.numeric(cm$overall[2]), 3), cex=1.4)
}  


#####################################
pkgs <- c("caret", "e1071", "rpart", "rpart.plot")
install.packages(pkgs)

## load data
path = 'd:/rtemp/Breast_Cancer/beast_cancer_dataset.csv'
data <- read.csv(path)
data

## data mining
str(data)
head(data)
tail(data)
length(data)

summary(data)

## data clean
# 刪除X (全為NA)
data <- data[, !colnames(data) %in% c("X")]
str(data)

library(rpart)
library(rpart.plot)
## Decision Tree
tree_model <- rpart(diagnosis ~ ., data = data, method = "class")

# 繪製樹狀圖
rpart.plot(tree_model)


## split training/testing set
library(caret)

set.seed(123)
index <- createDataPartition(data$diagnosis, p = 0.8, list = FALSE)
train_data <- data[index, ]
test_data <- data[-index, ]

## PCA
# 執行PCA
pca_result <- prcomp(train_data[, -which(names(train_data) == "diagnosis")], center = TRUE, scale. = TRUE)

# 提取前兩個主成分
pca_data <- as.data.frame(pca_result$x)

# 將診斷信息合併到PCA數據中
pca_data$diagnosis <- train_data$diagnosis

library(ggplot2)

# 使用ggplot2進行可視化
ggplot(pca_data, aes(x = PC1, y = PC2, color = diagnosis)) + 
  geom_point() +
  theme_minimal() +
  ggtitle("PCA of Breast Cancer Data") +
  xlab("Principal Component 1") +
  ylab("Principal Component 2")


# 查看結果
summary(pca_result)

# 使用ggplot2進行數據可視化，例如繪製PCA結果
ggplot(train_data, aes(x = PCA1, y = PCA2, color = diagnosis)) + geom_point()


library(e1071)

# 切分訓練集和測試集
set.seed(123)
train_indices <- sample(1:nrow(data), 0.8 * nrow(data))
train_data <- data[train_indices, ]
test_data <- data[-train_indices, ]

# 建立SVM模型
svm_model <- svm(diagnosis ~ ., data = train_data, type = 'C-classification', kernel = 'radial')

# 預測和評估
predictions <- predict(svm_model, test_data)
table(predictions, test_data$diagnosis)
