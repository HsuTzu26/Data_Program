# 
# 實例ch11_2.R
#
ch11_2 <- function( x )
{
  x.percent <- round(x * 100, digits = 2)      #執行轉換
  x.final <- paste(x.percent, sep = "", "%")   #加上百分比
  return(x.final)                              #傳回
}