# 
# 實例ch12_19.R
#
ch12_19 <- function( deg, customer, unitPrice = 50 )
{
   listprice <- deg * unitPrice * 
     ifelse (deg > 150, 0.8, 1)       #原始電費
   adj <- numeric(0)
   for ( i in customer) {
     adj <- c(adj, switch(i, goverment = 0.8, company = 1.2, 1))
   }
   finalprice <- listprice * adj      #最終電費
   round(finalprice)                  #電費取整數
}