#
# 實例ch12_23.R
#
ch12_23 <- function(x)
{
  sumx <- 0
  i <- 0
  while ( i <= x )
  {
    if ( i == x ) break
    sumx <- sumx + i
    i <- i + 1 
  }
     return (sumx)
}