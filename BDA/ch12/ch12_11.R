# 
# 實例ch12_11.R
#
ch12_11 <- function( deg, unitPrice = 50 )
{
   net.price <- deg * unitPrice       #計算電費
   net.price = net.price * ifelse(( deg > 100 ), 1.15, 0.85 ) 
   round(net.price)                   #電費取整數
}