# 
# 實例ch11_8.R
#
ch11_8 <- function( x, x.digits)
{
  x.percent <- round(x * 100, digits = x.digits) #執行轉換
  paste(x.percent, sep = "", "%")                #加上百分比和輸出
}