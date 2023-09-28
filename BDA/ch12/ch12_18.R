# 
# 實例ch12_18.R
#
ch12_18 <- function( n )
{
  p_sum <- 0
  for ( i in state.x77[, "Population"]) 
    p_sum <- p_sum + i
  print(p_sum)
}