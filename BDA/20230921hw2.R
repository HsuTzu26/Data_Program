#參考實例ch4_84，列出當月有31 天的月份名稱。
month.data<-c(31,28,31,30,31,30,31,31,30,31,30,31)
month.data
names(month.data)<-month.name
names(month.data[month.data==31])

newislands<-sort(islands, decreasing = TRUE)
#4. 使用系統內建數據集islands，列出排序第30 和35 名的島名稱和面積。(從大排到小)
newislands[c(30,35)]

#5. 使用系統內建數據集islands，列出前15 大和最後15 大的島名稱和面積。(從大排到小)
head(newislands,15)
tail(newislands,15)

#6. 使用系統內建數據集islands，先排序，再分別列出奇數和偶數的島名稱和面積。(從大排到小)
newislands[seq(1, length(newislands), by=2)] # odd
newislands[seq(2, length(newislands), by=2)] # even
#7. 計算台灣的面積全球排名第幾? (從大排到小)
which(names(newislands)=="Taiwan")

