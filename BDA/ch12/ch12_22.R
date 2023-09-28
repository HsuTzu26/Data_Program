#
# 實例ch12_22.R
#
ch12_22 <- function(x)
{
  sumx <- 0
  repeat
  {
    sumx <- sumx + x
    if ( x == 0) break
    x <- x - 1
  }
     return (sumx)
}