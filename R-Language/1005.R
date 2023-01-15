install.packages("readr")
library(readr)
setwd("d:/")#以設定工作區d槽為例
test <- read.csv("WHO.csv",sep = ",",header = TRUE,stringsAsFactors =
                   FALSE) #讀取檔案
head(test)
str(test)#查看檔案資料結構
attach(test) #連續使用test檔案

#單變數--屬量變數
mean(CellularSubscribers) #有遺漏直算不出
mean(CellularSubscribers, na.rm = T)#移除遺漏值
sd(CellularSubscribers)
sd(CellularSubscribers, na.rm = T)
hist(CellularSubscribers)#屬量資料
hist(CellularSubscribers, breaks = 20)
boxplot(CellularSubscribers)
barplot(CellularSubscribers)
# 屬質變數-單變數
#barplot() 函數繪製長條圖來探索類別的頻率-需結合table:計算出次數
barplot(table(Region),las=2)
par(mfrow=c(1,1), cex=0.5, las=1) #調整畫布格式
barplot(table(Region)) 

#查找兩變數可能關連
#散布圖 Scatterplot -屬量對屬量
par(mfrow=c(1,2), cex=0.6, las=2)
plot(Under15, GNI)
plot(test$Population,test$CellularSubscribers)
par(mfrow=c(1,2), cex=0.6, las=1)
plot(Under15, GNI)
plot(GNI,CellularSubscribers)
#盒狀圖 Boxplot #需有屬質搭配屬量變數
boxplot(CellularSubscribers ~ Region, las=3)
boxplot(CellularSubscribers ~ Region,
        xlab = "", ylab = "CellularSubscribers",
        main = "CellularSubscribers of Countries by Region")
#屬質搭配屬量變數--似乎看出關係

#基礎繪圖
#直方圖
hist(GNI, main = "GNI Histogram", xlab = "GNI")
#散布圖
plot(GNI ~ LiteracyRate)
#盒鬚圖 單變數
boxplot(GNI) #鬍鬚-- 1.5 IQR-上下限（與傳統統計不同）
boxplot(GNI)$stats #呈現盒鬚圖相關統計值
#盒鬚圖 雙變數
boxplot(GNI~Region,las=1)


#進階繪圖
install.packages("ggplot2")#安裝ggplot2套件
library(ggplot2)
# as.factor(Region) #資料格式轉換-目前轉換與否，不影響
#單變數-可加上顏色--直方圖
ggplot(data = test) + geom_histogram(aes(x = GNI))
ggplot(data = test) + geom_histogram(aes(x = GNI),
                                     fill = "blue",bins = 30) #加上顏色並設定條數

#單變數—屬質變數
ggplot(data = test) + geom_bar(aes(x=Region)) #無須使用table
ggplot(data = test) + geom_bar(aes(x=Region),fill =
                                 "pink")

#雙變數 boxplot- 屬量對屬質；屬量對屬量
ggplot(data=test) + geom_boxplot(aes(x = GNI, color=Region))
ggplot(data=test) + geom_point(aes(x = GNI, y =
                                     LifeExpectancy))
ggplot(data=test) + geom_line(aes(x = GNI, y =
                                    LifeExpectancy))

#三個變數 兩個屬量搭配一個屬質
ggplot(data=test) + geom_point(aes(x = GNI, y =
                                     LifeExpectancy)) #僅兩個變數
ggplot(data=test) + geom_point(aes(x = GNI, y =
                                     LifeExpectancy, color= Region)) # 利用cloro加入屬質變數
# 加上屬質的變數後，地域變數的特徵應當可以看出！！

ggplot(data=test) + geom_point(aes(x = GNI, y = LifeExpectancy)) +
  facet_wrap(~Region) #透過圖層加第三個變數
ggplot(data=test) + geom_point(aes(x = GNI, y = LifeExpectancy,
                                   color= Region)) + facet_wrap(~Region)
#看出地區差異了嗎

# Diamonds 資料集-內建於ggplot2 安裝完可直接呼叫
install.packages("ggplot2")
library(ggplot2)
head(diamonds)

#三個變數 一個屬量搭配兩個屬質—使用ggplot2內建資料集-diamonds
str(test) #僅兩個屬質變數
str(diamonds) #多個屬質變數
ggplot(data=diamonds) + geom_boxplot(aes(x = price, color=cut))
ggplot(data=diamonds) + geom_boxplot(aes(x = price,
                                         color=cut))+facet_wrap(~clarity)

#改用散布圖-兩個屬量變數+一個屬質
ggplot(data=diamonds) + geom_point(aes(x = price, y=carat))
+facet_wrap(~cut)
# 利用color加入第四個變數
ggplot(data=diamonds) + geom_point(aes(x = price, y=carat,color= color))
+facet_wrap(~cut)

# ggplot2 資料、座標軸、圖層外，尚可加入--統計工具
ggplot(data=diamonds) + geom_point(aes(x = price,
                                       y=carat,color= color)) +facet_wrap(~cut)+
  geom_smooth(aes(x = price, y=carat))


ggplot(data = diamonds) + geom_histogram(aes(x =
                                               carat,bins= 20)) +facet_wrap(~color)
#散布圖活用 （僅繪Y軸，X軸固定為1）散布圖活用
#（僅繪Y軸，X軸固定為1）
ggplot(diamonds, aes(y = carat, x = 1)) + geom_point()
ggplot(diamonds, aes(y = carat, x = 1)) + geom_boxplot() #盒鬚圖
ggplot(diamonds, aes(y = carat, x = cut)) + geom_boxplot() #以cut為X軸，繪出不同圖層
ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin() #小提琴圖

#Hw - supermarket_sales.csv
install.packages("readr")
library(readr)
setwd("d:/")
testcsv <- read.csv("supermarket_sales.csv",sep=",",header = TRUE,stringsAsFactors =
                   FALSE)
str(testcsv)

install.packages("ggplot2")#安裝ggplot2套件
library(ggplot2)
ggplot(data=testcsv) +  geom_boxplot(aes(x=cogs, y=gross.income,
                                       color=City))+ facet_wrap(~City)

ggplot(data=testcsv) +  geom_boxplot(aes(x=cogs, y=gross.income,
                                       color=Payment))+ facet_wrap(~Payment)

ggplot(data=testcsv) +  geom_boxplot(aes(x=Tax.5., y=Unit.price,
                                       color=Product.line))+ facet_wrap(~Product.line)

ggplot(data=testcsv) +  geom_boxplot(aes(x=cogs, y=gross.income,
                                       color= Gender))+ facet_wrap(~ Gender)
