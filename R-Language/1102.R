getwd()
setwd("D:/")

install.packages("readxl")
library(readxl)
sales <- read_excel("salesR北中.xlsx") 
unique(sales$area)
factor(sales$area)
attach(sales)

cor.test(profit2, sales2)

ss <- lm(profit2~sales2)
summary(ss)

slmmodel <- lm(profit2~sales2+cost2)
summary(slmmodel)

#預測--建好回歸是可以進行預測
#建立要預測的資料值

newsales <- data.frame(sales2=5000)
newsales


#利用所建議的回歸模式預測利潤
predict(ss,newsales)


#回歸模式檢測—是否常態、殘差是否無固定模式
# 安裝並載入 ggfortify 套件
install.packages("ggfortify")
library(ggfortify)
autoplot(ss)

shapiro.test(ss$residual)

install.packages("car")
library(car)


durbinWatsonTest(ss)

ncvTest(ss)

#二因子變異數分析-如想探討type跟area對sales2的影響--也就是是不是某
#些地區的某些東西會賣得比較好
#要考慮到—交互效果

twoway<-aov(sales2~type*area, data=sales) #雙因子ANOVA含type*area交
#互作用項，結果存入twoway
summary(twoway) #顯示F檢定資料

print(model.tables(twoway,"means"),digits=3) #顯示各組平均數-3*2組


twoway<-aov(sales2~type+area, data=sales) #雙因子變異數分主效果分析-- 交互作用不顯著
summary(twoway)


##Practice

install.packages("RcmdrMisc") #安裝繪圖套件
install.packages("sandwich") #安裝繪圖套件
library(RcmdrMisc)
library(sandwich)
with(twoway, plotMeans(sales2,type,area,error.bars="se")) #繪出平均數


install.packages("ggplot2")
library(ggplot2)

str(diamonds)
attach(diamonds)

cor.test(price, carat)

dd <- lm(price~carat)
summary(dd)

newdd <- data.frame(carat=5.8)
newdd

predict(dd,newss)

dd_lm <- lm(price~carat+table+depth+x+y+z)
summary(dd_lm) 


twoway<-aov(price~cut+color, data=diamonds) #雙因子變異數分主效果分析-- 交互作用不顯著
summary(twoway)

with(twoway, plotMeans(price,cut,color,error.bars="se")) #繪出平均數

######

#資料轉換
#屬質轉屬質
table(quartly) #確認有多少個類型,以及編碼
#使用car套件裡面的recode函數
install.packages("car")
library(car)
str(sales)
sales$quartly_r <- recode


#屬量轉屬質
summary(profit2) #確認profit2的資料分布
#將profit2 -69051~-1346數編碼???L，-1347~4676???M，4677以上???H
sales$profit2_r <-recode(sales$profit2, "-69051:-1346='L';
-1347:4676='M'; else='H'")
#重編碼後增加新變數profit2_r屬質
str(sales)
#屬量轉屬量
summary(profit2) #確認profit2的資料分布
#將profit2 -69051~-1346數編碼???1，-1347~4676???2，4677以上???3
sales$profit2_r <-recode(sales$profit2, "lo:-1346='1';
-1347:4676='2'; else='3'")
#重編碼後增加新變數profit2_r屬量--lo用法
str(sales)



