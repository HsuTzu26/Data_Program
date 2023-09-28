# 
# 實例ch11_15.R
#
#將數值向量轉成百分比
percent.numeric <- function( x, Xfun = round, ...) 
{
  x.percent <- Xfun(x * 100, ...)        #執行轉換
  paste(x.percent, sep = "", "%")        #加上百分比和輸出
}
#將字元向量增加百分比符號
percent.character <- function( x )       
{
  paste(x, sep = "", "%")                #直接加百分比符號
}