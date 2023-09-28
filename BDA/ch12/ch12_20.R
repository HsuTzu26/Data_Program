# 
# 實例ch12_20.R
#
ch12_20 <- function( deg, customer, unitPrice = 50 )
{
   listprice <- deg * unitPrice * 
     ifelse (deg > 150, 0.8, 1)       #原始電費
   num.customer <- length(customer)
   adj <- numeric(num.customer)
   for ( i in seq_along(customer)) {
     adj[i] <- switch(customer[i], goverment = 0.8, company = 1.2, 1)
   }
   finalprice <- listprice * adj      #最終電費
   round(finalprice)                  #電費取整數
}