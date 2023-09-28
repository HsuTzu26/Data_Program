# 
# 實例ch12_24.R
#
ch12_24 <- function( n )
{
  sumx <- 0
  for ( i in n)
  {
    if ( sumx + i > 3000 ) break
    sumx <- sumx + i
  }
  print(sumx)
}