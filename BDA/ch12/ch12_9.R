# 
# 實例ch12_9.R
#
ch12_9 <- function( deg, poor = FALSE, unitPrice = 50 )
{
   net.price <- deg * unitPrice       #計算電費
   if ( deg > 100 )                   #如果使用超過100度
     net.price <- net.price * 1.15    #電費加收15%
   else {
     net.price <- net.price * 0.85    #電費減免15%
     if ( poor )                      #檢查是否符合清寒證明
       net.price = net.price * 0.7    #再減3成
   }
   round(net.price)                   #電費取整數
}