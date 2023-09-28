# 
# 實例ch13_4.R
#
ch13_4 <- function( deg, customer, unitPrice = 50 )
{
   listprice <- deg * unitPrice * 
     ifelse (deg > 150, 0.8, 1)       #原始電費
   adj <- sapply(customer, switch, goverment = 0.8, company = 1.2, 1)
   finalprice <- listprice * adj      #最終電費
   round(finalprice)                  #電費取整數
}