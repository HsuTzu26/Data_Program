# 
# 實例ch12_7.R
#
ch12_7 <- function( deg, unitPrice = 50 )
{
  if ( deg > 120 )                   #如果使用超過120度
    net.price <- deg * unitPrice * 1.15    #電費加收15%
  else if ( deg < 80 )               #如果使用少於80度
    net.price <- deg * unitPrice * 0.85    #電費減免15%
  else
    net.price <- deg * unitPrice           #正常收費
  round(net.price)                   #電費取整數
}