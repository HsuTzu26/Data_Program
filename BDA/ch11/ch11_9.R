# 
# 實例ch11_9.R
#
ch11_9 <- function( x, x.digits = 1)    #預設轉換到小數第1位
{
  x.percent <- round(x * 100, digits = x.digits) #執行轉換
  paste(x.percent, sep = "", "%")                #加上百分比和輸出
}