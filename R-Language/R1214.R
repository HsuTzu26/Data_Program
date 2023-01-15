setwd("D:/rtemp")
getwd()
load("sales_D.RData")
head(sales_D)
str(sales_D)
sales_D$group_p1 <- ifelse(sales_D$group_p == 'H', 1, 0)#將"H"/"L"轉換為0/1


sales1_glm1 <- glm(formula = group_p1 ~ ., family = "binomial", data = sales_D)

sales1_glm2 <- glm(formula = group_p1 ~ catalogue+type+sales2+cost2+profit2, family = "binomial", 
                   data = sales_D)

sales1_glm3 <- glm(formula = group_p1 ~ cost2, family = "binomial", data = sales_D) #不斷調整投入變數

summary(sales1_glm3)


##Practice
install.packages("AER")
library(AER)
data(CreditCard)

new <- data.frame(reports=0, age=30, income=10, owner="yes", months=50)

card_glm <- glm(formula = card ~ ., family = "binomial", data = CreditCard)

backcard <- subset(CreditCard, select = c(card, reports, age, income, owner, months))

card_glm <- glm(formula = card~., family = "binomial", data = backcard)

result <- predict(card_glm, newdata = new, type="response")
result # 0.98

new2 <- data.frame(reports=1, age=30, income=5, owner="no", months=50)

result <- predict(card_glm, newdata = new2, type="response")
result # 0.66

####
#kmeans iris為例
iris2=iris[,-5] #剔除最後一欄--品種變數，產生新資料集iris2
set.seed(1234)
kmeans.result=kmeans(iris2,3) #設定3各個集群，以kmean函數進行分群
kmeans.result #產生新的欄位cluster
kmeans.result$cluster #查看各資料的分類結果
table(kmeans.result$cluster)
table(iris$Species, kmeans.result$cluster) #比對原有分類與新分類
head(iris)
plot(iris2,col=kmeans.result$cluster)
#繪圖 以花萼長度與寬度為兩軸，加上分群結果
plot(iris2[c("Sepal.Length", "Sepal.Width")], col=kmeans.result$cluster)
#繪圖 以花辦長度與寬度為兩軸，加上分群結果
plot(iris2[c("Petal.Length", "Petal.Width")], col=kmeans.result$cluster)

#k-K-Medoids
install.packages("fpc") #載入K-Medoids套件
library(fpc)
pamk.result=pamk(iris2) #不用設定集群數
pamk.result
table(iris$Species, pamk.result$clustering)
table(iris$Species, pamk.result$pamobject$clustering)
plot(iris2, col=pamk.result$pamobject$clusterin) #繪圖-- plot(pamk.result$pamobject$clusterin) #繪圖--看分群基準
#繪圖 以花萼長度與寬度為兩軸，加上分群結果
plot(iris2[c("Sepal.Length", "Sepal.Width")], 
     col=pamk.result$pamobject$clusterin)
#繪圖 以花辦長度與寬度為兩軸，加上分群結果
plot(iris2[c("Petal.Length", "Petal.Width")], 
     col=pamk.result$pamobject$clusterin)

#繪圖-群聚圖
plot(pamk.result$pamobject) #Silhouett係數範圍在-1 (非常差)和1 (非常好)之間
#改設為3群
pamk.resultB=pamk(iris2,3) #設定3群
pamk.resultB
table(iris$Species, pamk.resultB$pamobject$clustering)
plot(iris2, col=pamk.resultB$pamobject$clustering) #繪圖-- plot(pamk.resultB$pamobject$clustering) #繪圖--看分群基準
plot(iris2[c("Sepal.Length", "Sepal.Width")], 
     col=pamk.resultB$pamobject$clusterin)
#繪圖-群聚圖
plot(pamk.resultB$pamobject)
