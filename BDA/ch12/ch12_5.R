# 
# 實例ch12_5.R
#
ch12_5 <- function( deg, unitPrice = 50 )
{
   net.price <- deg * unitPrice                   #計算基本電費
   adjustment <- if ( deg > 100 ) 1.15 else 0.85  #計算調整比率
   total.price <- net.price * adjustment          #重新計算電費               
   round(total.price)                             #電費取整數
}