# 110 unit 01-1

#R特色-簡易指令--用現有函數即可進行資料分析
x<-seq(1,15) #產生1～15的數字
x
mean(x)
sd(x)
boxplot(x)

#R變數指定與四則運算
a  <-  10
b <-  55
b
a  +  b
a  +  b
a-b
a*b
b/a
2.4  +  42
a ^  2
sqrt (100)  #利用函數開根號
sqrt(b)

#確認工作環境與資料讀入與存檔--
getwd()  #確認工作路徑
setwd('d:/rtemp') #指定工作路徑
getwd()
install.packages("readxl") #安裝套件
library(readxl)#使用可讀取xlsx的套件
excsales = read_excel("excsales01.xlsx")
#資料總覽 Data Summary
str(excsales)#查看檔案資料結構
head(excsales)
summary(excsales)
attach(excsales)
mean(sales2)  #活用敘統相關函數
boxplot(sales2)
sd(sales2)
mean(cost2)
boxplot(cost2)
sd(cost2)
save(excsales, file = "excsales.RData")

#資料讀取與存檔
#csv檔
install.packages("readr")
library(readr)
getwd()
rtest = (read.csv("data.csv"))
head(rtest)
#練習--屬量變數的敘述統計跟繪出盒鬚圖

#讀檔--Rdata
setwd('d:/rtemp')
load("sales_D.RData")
str(sales_D)

#資料檢索
sales_D[2]
sales_D[2,3]
sales_D[2,]
sales_D[101:105,] #範圍索引
sales_D[, c(2:4, 5, 7:9)]  #向量索引
sales_D[sales_D$profit2 > 500 & sales_D$area == "北部", c(4:9)] #邏輯索引
sales_D[ , c("type", "catalogue")] #名稱索引
sales_D[ c(2:4) , c("type", "catalogue")] #名稱索引

str(sales_D)
class(sales_D$catalogue)
factor(sales_D$area)

#內建資料檔
head(iris) #顯示前六筆
iris #直接顯示所有資料

install.packages("ggplot2")
require(ggplot2)
data(diamonds)
head(diamonds)


#即刻上手--活用sales_D
# 探索 sales_D 變數的分佈-單一變數
# hist() 直方圖探索數值變數
str(sales_D)
attach(sales_D) #持續使用某檔案
hist(sales2)
#barplot() 函數繪製長條圖來探索類別的頻率-需結合table:計算出次數
barplot(table(type))

# 分類對比
# boxplot() 函數繪製盒鬚圖來探索不同類別與數值分佈的關係
boxplot(sales2~ type)   #已指定使用某檔案，因此可以無需宣告資料檔為何
boxplot(sales2~ type, data=sales_D)
boxplot(sales2~ area, data=sales_D)
boxplot(sales2~ catalogue, data=sales_D)
boxplot(sales2~ city, data=sales_D)

hist(sales2, main = "Sales Histogram", xlab = "Sales")
plot(cost2~ profit2, data =sales_D) 

boxplot(profit2~city, data = sales_D,las=1)
boxplot(profit2~area, data = sales_D,las=1)
install.packages("ggplot2")
require(ggplot2)
ggplot(data = sales_D) + geom_histogram(aes(x = profit2))
ggplot(data = sales_D) + geom_histogram(aes(x = profit2,fill= city)) +facet_wrap(~city)


# 主要資料種類 - Data Type (Class) 
# int (integer) : 整數
# num (numeric) : 實數
# logical (Boolean/binary) : 邏輯(二元) 
# chr (character) : 字串
# Date : 日期(時間)
# Factor / levels : 類別

# 主要資料結構 - 
# 單值(scaler) ：數值、類別、字串、日期
# 向量(vector) 
# 矩陣(matrix)：向量的延伸—多維，運算為主，
# 因此多為數值
# 資料框(data frame) ：類似excel，
# 序列(list)：多層次資料結構=

#常見資料種類
#str()#可顯示資料結構
#數值：num
#整數：is.interger()；強迫指派為整數
#字元或字串：chr；僅有幾種，則為因子factor，如男、女生
#日期：邏輯：True/ False
#檢視資料類別：class


# 0928
str(iris)
class(iris$Sepal)
class(iris$Sepal.Length)
levels(iris$Species)

#-----------------
#資料型態、資料結構
#資料型態 文字（字串）、數值、整數、邏輯（布林）


#資料結構-向量與變數指定
# 向量只容許一種類別 (字串 > 數值 > 布林)
# numeric vector
x <- c(4.39, 2.11, 3.17)
x
# character vector，以雙引號 " " 或單引號 ' ' 註記 
y <- c("apple", "book", "cat")
y
# logical vector，以TRUE / FALSE 註記，亦可簡化為 T / F
z <- c(TRUE, FALSE, TRUE)
z

k<c(TRUE,"apple",3.17)  #不同資料形態導致錯誤
k

class(x) # 可利用class(x)查詢物件的類別
x<-c(1, 2, "three") # 數值被轉換成字串
x
y<-c(2.11,2,TRUE,FALSE)
y

#資料類別轉換
# 字串轉數字
a1 <- c("89", "91", "102")
as.numeric(a1)
a1
# 布林轉數字
a2 <- c(TRUE, TRUE, FALSE)
as.numeric(a2)
a2
# 數字轉布林
a3 <- c(-2, -1, 0, 1, 2)
as.logical(a3)
a3
# 數字轉字串
as.character(a3)
a3

#向量操作
four_seasons <- c("spring", "summer", "autumn", "winter")
lucky_numbers <- c(7, 13, 24, 34, 87)
four_seasons
length(four_seasons)
lucky_numbers
length(lucky_numbers)

#抽屜
four_seasons <- c("spring", "summer", "autumn", "winter")
msg <- sprintf("My favorite season is %s.", four_seasons[3])
msg


#資料框-它可以將多個相同長度的向量合併(by column)
x <- c(4.39, 2.11, 3.17, 5.43)
y <- c("apple", "book", "cat", "baby")
z <- c(TRUE, FALSE, TRUE, FALSE)
df<- data.frame(x,y,z)
df
df1 <- data.frame(v1 = x, v2 = y, v3 = z)
df1
colnames(df) # 展示物件的欄位名稱
rownames(df) # 展示物件的列名稱
#data.frame 利用 [row, col] 提取物件內容
df[, 1] # select the value of 1st column
df[, "v1"]#欄位名稱前後雙引號，selcet all rows and v1 column
df[2, ] # select 2nd row and all column

# rbind (上下合併)、cbind (左右合併)
xy<- rbind(x,y)
xy
xz<-cbind(x,y)
xz
xk<-cbind(x,xz)
xk#  第一欄重複
xk<-cbind(x,xz[,-1])  #剔除xz第一欄
xk
#篩選搜尋
df
df[df$v1 > 3 & z==TRUE, "v2"] #找第一欄大於3，第三欄為TRUE，的所有第二欄資料


#向量與資料框
a  <- c(1,2,3,4)
b  <-as.factor(a)
c  <- c("test", "a", "b","f")
d <- data.frame(a,b,c)
d
dim(d)  #查d有幾列幾行
#列名、欄名查詢
names(d)
rownames(d)






