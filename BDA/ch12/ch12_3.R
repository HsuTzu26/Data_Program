# 
# 實例ch12_3.R
#
ch12_3 <- function( deg, unitPrice = 50 )
{
   net.price <- deg * unitPrice       #計算電費
   if ( deg > 200 )                   #如果使用超過200度
      net.price <- net.price * 1.15   #電費加收15%
   round(net.price)                   #電費取整數
}