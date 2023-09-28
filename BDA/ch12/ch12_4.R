# 
# 實例ch12_4.R
#
ch12_4 <- function( deg, unitPrice = 50 )
{
   net.price <- deg * unitPrice       #計算電費
   if ( deg > 100 )                   #如果使用超過100度
     net.price <- net.price * 1.15    #電費加收15%
   else
     net.price <- net.price * 0.85    #電費減免15%
   round(net.price)                   #電費取整數
}