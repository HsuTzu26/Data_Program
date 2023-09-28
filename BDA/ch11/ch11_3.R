# 
# 實例ch11_3.R
#
ch11_3 <- function( x )
{
  x.percent <- round(x * 100, digits = 2)      #執行轉換
  x.final <- paste(x.percent, sep = "", "%")   #加上百分比
}