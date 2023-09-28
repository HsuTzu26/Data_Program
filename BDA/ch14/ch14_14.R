#
# 實例ch14_14.R
#
ch14_14 <- function( )
{
  cat("R Language")
  cat("\n")                      #換列列印
  cat("A road to Big Data\n")
  x <- 10
  y <- 20               
  cat(x, y, "\n")                #預設是空1格
  cat(x, y, x+y, sep = "     ")  #增加空的格數
  cat("\n")
  cat(x, y, "x+y=", x+y)
}