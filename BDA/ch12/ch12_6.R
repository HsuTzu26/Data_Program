# 
# 實例ch12_6.R
#
ch12_6 <- function( deg, unitPrice = 50 )
{
   net.price <- deg * unitPrice         #計算電費
   total.price <- net.price * if ( deg > 100 ) 1.15 else 0.85                  
   round(total.price)                   #電費取整數
}