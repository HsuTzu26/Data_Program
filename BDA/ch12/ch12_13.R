# 
# 實例ch12_13.R
#
ch12_13 <- function( deg, unitPrice = 50 )
{
  if (deg > 120) index <- 1
  if (deg <= 120 & deg >= 80) index <- 2
  if (deg < 80)  index <- 3
  switch (index, 
    net.price <- deg * unitPrice * 1.15,    #電費加收15%
    net.price <- deg * unitPrice,           #正常收費
    net.price <- deg * unitPrice * 0.85)    #電費減免15%
  round(net.price)                   #電費取整數
}