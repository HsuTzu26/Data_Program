# 
# 實例ch12_17.R
#
ch12_17 <- function( n )
{
  counter <- 0
  for ( i in n) 
  {
    if ( i == "North Central")
      counter <- counter + 1
  }
  print(counter)
}