## load data
path = 'd:/rtemp/Breast_Cancer/beast_cancer_dataset.csv'
data <- read.csv(path)
data

# data mining
length(data)
head(data)
summary(data)

# 轉換因子變量 (例如：將診斷結果M, B轉為數值型態)
data$diagnosis <- as.factor(data$diagnosis)
# M- 惡性 B- 良性

library(ggplot2)

# 探索性資料分析，例如繪製各變量的分布
ggplot(data, aes(x = radius_mean)) + geom_histogram(binwidth = 1)

## data clean
# 刪除X (全為NA)
data <- data[, !colnames(data) %in% c("X")]
str(data)

data_B
data_M

library(rpart)

# 建立決策樹模型
decision_tree_model <- rpart(diagnosis ~ ., data = train_data, method = "class")

# 繪製決策樹
rpart.plot(decision_tree_model, main="決策樹", extra=100)


