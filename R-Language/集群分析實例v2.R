#### Class 集群分析實例 ####

## 讀取資料 ##
load('D:/rtemp/data_20221228.RData')

for(i in colnames(data)) {
  if(i == 'Party_ID') {
    print(i)
  } else if(class(data[,i]) == 'factor') {
    print(i)
    print(levels(data[,i]))
    print(table(data[,i], useNA = 'always'))
  } else {
    print(i)
    print(summary(data[,i]))
  }
  print('--------------------------------')
}

for(i in colnames(DATA)) {
  cat(i, 'class is: ', class(DATA[,i]), 
      '\t na count: ', length(which(is.na(DATA[,i]) == T)), '\n')
}


#### Clustering ####
library(cluster)
library(factoextra)
library(clustMixType)
library(dbscan)
library(dummy)

## 將類別資料做成dummy variables
DUM_DATA <- dummy(DATA)

for(i in colnames(DUM_DATA)) {
  DUM_DATA[,i] = as.numeric(DUM_DATA[,i])
}
DUM_DATA <- cbind(DUM_DATA, DATA$AGE, DATA$Annual_Income_Amt, DATA$Deposit_Amt)

set.seed(5555)
idx = sample(1:21663, 10000)
DUM_DATA_TRAIN <- DUM_DATA[idx,]
DUM_DATA_TEST <- DUM_DATA[-idx,]
DATA_TRAIN <- DATA[idx,]
DATA_TEST <- DATA[-idx,]
  
## K-Means ##
RESULT_Kmeans <- kmeans(DUM_DATA_TRAIN, centers=3)
# RESULT_Kmeans <- kmeans(data, centers=3, iter.max = 1000, nstart=5)
RESULT_Kmeans$cluster
table(RESULT_Kmeans$cluster)
RESULT_Kmeans$withinss # 群內變異

## K-Medoid ##
RESULT_Kmedoid <- pam(DUM_DATA_TRAIN, k=3)
RESULT_Kmedoid$clustering
table(RESULT_Kmedoid$clustering)
RESULT_Kmedoid$objective

## CLARA ##
RESULT_clara <- clara(DUM_DATA_TRAIN, 3, metric="euclidean", stand=T)
table(RESULT_clara$clustering)

## K-Prototypes ##
RESULT_kproto <- kproto(DATA_TRAIN, 3)
table(RESULT_kproto$cluster)
# RESULT_kproto <- kproto(iris, 3, iter.max=100, nstart=5)

## Hierarchical ##
RESULT_agnes <- agnes(DUM_DATA_TRAIN, method="average")
RESULT_agnes <- agnes(DUM_DATA_TRAIN, method="average", stand=T) # 標準化
RESULT_agnes <- agnes(DUM_DATA_TRAIN, metric="manhattan", method="complete", stand=T)

RESULT_hiera <- hclust(dist(DUM_DATA_TRAIN, method="euclidean"), method="average")
RESULT_hiera <- hclust(dist(DUM_DATA_TRAIN, method="manhattan"), method="complete")

RESULT_diana <- diana(DUM_DATA_TRAIN)
RESULT_diana <- diana(DUM_DATA_TRAIN, metric="manhattan")

## Density ##
RESULT_dbscan <- dbscan(DUM_DATA_TRAIN, eps = 1, minPts = 5, borderPoints = T)
table(RESULT_dbscan$cluster)

## 決定最佳群數 ##
fviz_nbclust(DUM_DATA_TRAIN, FUN = hcut, method = "wss")
fviz_nbclust(DUM_DATA_TRAIN, FUN = hcut, method = "silhouette")

## 繪圖 ##
fviz_cluster(RESULT_Kmeans, data = DUM_DATA_TRAIN)

#### 將分群結果用在新的資料中 ####
DATA_TRAIN$Cluster <- as.factor(RESULT_Kmeans$cluster)

## Decision Tree ##
library(rpart)

Start = Sys.time()
Model_rpart <- rpart(Cluster ~ ., data = DATA, method = 'class')
End = Sys.time()
print(End-Start)
Model_rpart
summary(Model_rpart)

plot(Model_rpart, margin=0.1)
text(Model_rpart,use.n=TRUE, cex=0.8)

rpart_vaild <- predict(object = Model_rpart, newdata = DATA, type = 'class')
caret::confusionMatrix(rpart_vaild, DATA$Cluster)

