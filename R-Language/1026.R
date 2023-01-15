getwd()
setwd("D:/")

install.packages("readxl")
library(readxl)
sales <- read_excel("salesR北中.xlsx")
attach(sales)
t.test(profit2,conf.level=0.95)

t.test(profit2,mu=4500, conf.level=0.95) #雙尾檢定
#檢定結果判定 由t或者p值 判定。
#本例—雙尾，顯著水準為0.025
#—樣本僅有0.01876的機率會在4500上下
#—因此落於拒絕域—不等於4500
#R 所估信賴區間-是樣本平均數的信賴區間


t.test(profit2,mu=4500, alternative="less", conf.level=0.90) #左尾檢定
#檢定結果判定:本例—單尾，
#樣本t= -2.3528，大於4500的p值為0.0094，
#因此拒絕虛無假設，接受對立假設---不大於4500


t.test(profit2,mu=4500, alternative="greater", conf.level=0.90) #右尾檢定
#檢定結果判定:拒絕 -本例—單尾，
#顯著水準為0.1，樣本t= -2.3528，
#有p值為0.9906的可能落於接受域—接受虛無假設—小於4500


#Practice
install.packages("ggplot2")
library(ggplot2)
attach(diamonds)

t.test(price, conf.level=0.9)
t.test(x, mu=5.7,  conf.level = 0.9)
t.test(x, mu=5.8,  alternative="less",conf.level = 0.9)
t.test(x, mu=5.74,  alternative="greater",conf.level = 0.9)


####
#雙樣本檢定---屬質對屬量—如area分為北部、中部，想探討北中部的profit是否有差異
#變異數同質性檢定—理論上要做-因為兩群資料變異數同質與否，有不同檢定思維
bartlett.test(profit2~area) #兩個水準在同欄位 或 var.test (x, y) 不同欄 #要視資料組成而定


attach(sales)
#雙樣本雙尾檢定
t.test(profit2~ area, alternative= "two.sided",var.equal=T) # 因變數～自變數，檢定型態，變異數是否相等 T:變異數相等
t.test(profit2~ area, alternative= "two.sided",var.equal=F) #不等


#Practice
attach(sales)
t.test(profit2~ area, alternative='two.sided',var.equal=F)
t.test(cost2~ area, alternative='two.sided',var.equal=F)

####
#變異數同質檢定
bartlett.test(sales2~(type))
#-----變異數不同質，事後比較分析 Welch's ANOVA
oneway.test(sales2 ~ type, data = sales, var.equal = FALSE)
#-----變異數不同質，事後比較分析 DTK
install.packages("DTK")
library(DTK)
attach(sales)
posthoc<- with(sales, DTK.test(sales2,type))
posthoc
#變異數同質之檢定：
y<-aov(lm(sales2~factor(type)))
summary(y)
#事後比較：
TukeyHSD(y)
plot(TukeyHSD(y))
#兩屬質變數--卡方檢定----檢定兩屬質變數是否有差異
chisq.test(type,area)
chisq.test(type,catalogue)
chisq.test(type,city)
table(type,area) #可先製作列聯表看是否有顯著差異，之後進行檢定

#Practice
attach(diamonds)
table(cut,clarity)
chisq.test(cut,clarity)

table(cut,color)
chisq.test(cut,color)

table(color,clarity)
chisq.test(color,clarity)
