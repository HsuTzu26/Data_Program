# 
# 實例ch12_12.R
#
ch12_12 <- function( deg, poor = FALSE, unitPrice = 50 )
{
   net.price <- deg * unitPrice       #計算電費
   net.price <- net.price * ifelse (deg > 100, 1.15, 0.85)
   net.price <- net.price * ifelse (deg <= 100 & poor, 0.7, 1)
   round(net.price)                   #電費取整數
}