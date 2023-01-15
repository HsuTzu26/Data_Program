#常見資料種類
#str()#可顯示資料結構
#數值：num
#整數：is.interger()；強迫指派為整數
# 字元或字串：chr；僅有幾種，則為因子factor，如男、女生
# 日期：邏輯：True/ False
# 檢視資料類別：class

str(iris)
class(iris$Species)
class(iris$Sepal.Length)
levels(iris$Species)


getwd()
setwd("d:/")
getwd()
install.packages("readr")
library(readr)
test <- read.csv("WHO.csv", sep=",",header=TRUE,stringsAsFactors = FALSE)
test

str(test)
head(test)
mean(test$Under15)
sd(test$Under15)
summary(test$Under15)
which.min(test$Under15)
which.max(test$Under15)


# 常用的圖
# – 直方圖-屬量-單變數
# – 長條圖-屬量/質均可，經計算可以呈現多變數
# – 圓餅圖-屬量/質均可，經計算可以呈現多變數
# – 散布圖-兩屬量變數
# – 盒鬚圖-屬量為主，亦可搭配屬質- • 常用繪圖控制參數—參考
par(mfrow=c(1,2), cex=0.6, las=2)
mfrow=c(1,2) #:一列有2張圖；
cex=0.6 #:字體大小
# las:控制X軸Y軸文字的方向，有0~3可以選，常用2
# • xlab, ylab：x,y軸標籤，main圖標題；col:顏色選擇, labels=labs,
init.angle=90
abline(v=10000, h=2.5, col="pink")#劃出基準線，設定垂直與水平線的高度

#簡易繪圖----以WHO檔案為例
#直方圖 Histogram-屬質-單變數
hist(test$CellularSubscribers)#屬量資料
attach(test)
hist(CellularSubscribers, breaks = 20)
mean(test$CellularSubscribers)
mean(test$CellularSubscribers, na.rm = T)#移除遺漏值
sd(test$CellularSubscribers)
sd(test$CellularSubscribers, na.rm = T)
#線圖 plot原為散布圖--畫兩變數間關係--亦可用為單變數之用
plot(Population,type = "l") #如有時間資料，或是索引資料

# 屬質變數-單變數
#barplot() 函數繪製長條圖來探索類別的頻率-需結合table:計算出次數
attach(test) #連續使用test檔案
barplot(table(Region),las=2)
par(mfrow=c(1,1), cex=0.5, las=1) #調整畫布格式--相關設定參考ppt
#mfrow=c(1,2):一列有2張圖；cex=0.6:字體大小；las:控制X軸Y軸文字的方向，有0~3可以選，常用2
#xlab, ylab：x,y軸標籤，main圖標題；col:顏色選擇
barplot(table(Region))
#查找兩變數可能關連
#散布圖 Scatterplot -屬量對屬量
par(mfrow=c(1,2), cex=0.6, las=2)
plot(test$Under15, test$GNI)
plot(test$Population,test$CellularSubscribers)

par(mfrow=c(1,1), cex=0.6, las=1)
plot(test$Under15, test$GNI)
plot(test$GNI,test$CellularSubscribers)
#盒狀圖 Boxplot #需有屬質搭配屬量變數
boxplot(test$CellularSubscribers ~ test$Region, las=3)
boxplot(test$CellularSubscribers ~ test$Region,
        xlab = "", ylab = "CellularSubscribers",
        main = "CellularSubscribers of Countries by Region")


#進階繪圖----以IRIS檔案為例
pie(table(Species),main = "圓餅圖")#--屬質/量均可--需運算
barplot(table(Species)) --#屬質/量均可--需運算
  texts <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
lables <-texts #將texts設定為lables
#圓餅圖標籤要用lables設定--需為向量
ss<- c(sum(Sepal.Length),sum(Sepal.Width),sum(Petal.Length),sum(Petal.Width))
#資料先做加總計算—亦可做平均計算
ss #顯示資料值
#以加總值繪出圓餅圖
pie(ss,lables,border="green",main="特徵",
    col=c("red","orange","lightblue","lightgreen"))
#以加總值繪出長條圖，但標籤的參數為names.arg
barplot(ss,names.arg=texts,border="green",main="特徵",
        col=c("red","orange","lightblue","lightgreen"))

#計算平均值
ms<-
  c(mean(Sepal.Length),mean(Sepal.Width),mean(Petal.Length),mean(Petal.Width))
ms
#改顯示平均值
barplot(ms,names.arg=texts,border="green",
        main="特徵",col=c("red","orange","lightblue","lightgreen"))
#ss是加總後的向量資料；用names.arg設定標籤；用border設定邊框顏色- 顏色要用","；用main設定標題，用col設定顏色
lables <-texts
#圓餅圖標籤要用lables設定--需為向量
pie(ms,lables,border="green",main="特徵",
    col=c("red","orange","lightblue","lightgreen")) #以平均值繪出圓餅圖
iris
plot(iris$Sepal.Length,type = "l")
str(iris)

install.packages("readr")
library("readr")
rcsv <- read.csv("supermarket_sales.csv", sep=",",header=TRUE,stringsAsFactors = FALSE)
rcsv
