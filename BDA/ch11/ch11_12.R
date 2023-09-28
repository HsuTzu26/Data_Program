# 
# 實例ch11_12.R
# 呼叫時，若省略第2個參數，預設是執行round( )函數
#
ch11_12 <- function( x, Xfun = round, ...)    
{
  x.percent <- Xfun(x * 100, ...)       #執行轉換
  paste(x.percent, sep = "", "%")       #加上百分比和輸出
}