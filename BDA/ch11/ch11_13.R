# 
# 實例ch11_13.R
# 
ch11_13 <- function( x, Xfun = round, ...)    
{
  x.percent <- Xfun(x * 100, ...)       #執行轉換
  paste(x.percent, sep = "", "%")       #加上百分比和輸出
}