# 
# 實例ch11_11.R
#
ch11_11 <- function( x, ...)            #預設轉換不帶小數之整數
{
  x.percent <- round(x * 100, ...)      #執行轉換
  paste(x.percent, sep = "", "%")       #加上百分比和輸出
}