#
# 實例ch14_19.R
#
ch14_19 <- function( )
{
  write(letters, file = "", ncolumns = 5)   #輸出至螢幕有5欄
  write(letters, file = "")                 #輸出至螢幕有1欄
  write(letters, file = "d:/cyhsu/Rcb1507/cb1507/ch14_19test1.txt", ncolumns = 5)
  write(letters, file = "d:/cyhsu/Rcb1507/cb1507/ch14_19test2.txt")     
  x1 <- 1:10
  write(x1, "", ncolumns = 4, sep = ",")
  x2 <- matrix(1:10, nrow = 2)
  write(x2, file = "", ncolumns = 5)
}

