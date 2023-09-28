# 
# 實例ch11_5.R
#
ch11_5 <- function( x )
{
  if ( !is.numeric(x))
  {
    print("需傳入數值向量")
    return(NULL)
  }
  x.percent <- round(x * 100, digits = 2)      #執行轉換
  paste(x.percent, sep = "", "%")              #加上百分比和輸出
}