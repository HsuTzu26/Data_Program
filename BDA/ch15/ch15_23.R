#
# 實例ch15_23.R
#
ch15_23 <- function( )
{
  i <- which(duplicated(iris))
  x <- iris[-i, ]
  print(x)
}