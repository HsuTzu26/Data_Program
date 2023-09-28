# 
# 實例ch11_10.R
#
ch11_10 <- function( x, x.digits = 0)    #預設轉換到小數第0位
{
  x.percent <- round(x * 100, digits = x.digits) #執行轉換
  paste(x.percent, sep = "", "%")                #加上百分比和輸出
}