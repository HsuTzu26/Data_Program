# 
# 實例ch12_25.R
#
ch12_25 <- function( n )
{
  sumx <- 0
  for ( i in n)
  {
    if ( i %% 2 != 0) next
    sumx <- sumx + i
  }
  print(sumx)
}