# 
# 實例ch11_4.R
#
ch11_4 <- function( x )
{
  x.percent <- round(x * 100, digits = 2)      #執行轉換
  paste(x.percent, sep = "", "%")              #加上百分比和輸出
}