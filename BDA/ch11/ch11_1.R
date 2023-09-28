# 
# 實例ch11_1.R
#
x <- c(0.8932, 0.2345, 0.07641, 0.77351)      #設定數值向量
x.percent <- round(x * 100, digits = 2)       #執行轉換
x.final <- paste(x.percent, sep = "", "%")    #加上百分比
print(x.final)                                #列印結果