#
# 實例ch12_21.R
#
ch12_21 <- function(x)
{
  sumx <- 0
  while ( x >= 0 )
  {
    sumx <- sumx + x
    x <- x - 1 
  }
     return (sumx)
}