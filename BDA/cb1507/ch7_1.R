mit.Name <-c("Kevin","Peter","Frank","Meggie")
mit.Gender <-c("M","M","M","F")
mit.Height <-c(170,175,165,168)
mit.info <-data.frame(mit.Name, mit.Gender, mit.Height, stringsAsFactors = FALSE)
Weight<-c(65, 71,58,55)
mit.info$Weight<-Weight
Age <- c(19, 20, 20,19)
Score <- c(88,91, 75, 80)
A1<-data.frame(Age, Score)
mit.info <-cbind(mit.info,A1)
mit.info <-rbind(mit.info, c("Amy","F", 161, 58, 20,95))
mit.info <-rbind(mit.info, c("Roger","M", 181, 78, 19,87))
mit.info <-rbind(mit.info, c("Mary","F", 171, 57, 18,93))

#假如要刪掉第二列(Mid的數據)，就直接將除了第二列以外的數據直接指定給mit.info
mit.infonew <- mit.info[-2,]
##一樣用上述的方式還是可以找的到
mit.info[mit.info$Age ==19,]

##若要找 Age 為 18 與 19 的資料
mit.info[mit.info$Age %in% c(18,19),]

##也可以用 subset 函數來找 Age為19的 欄位

subset(mit.info, Age == 19)

mit.info.sub3 <- subset(mit.info, Age == 19)
## 也可以多條件查詢

mit.info.sub5 <- subset(mit.info, Score < 90 & Score > 80)
