#
# 實例ch14_18.R
#
ch14_18 <- function( )
{
  x1 <- scan("~/Rbook/ch14/ch14_18test1.txt")
  cat(x1, "\n")
  x2 <- scan("~/Rbook/ch14/ch14_18test2.txt")
  cat(x2, "\n")
  x3 <- scan("~/Rbook/ch14/ch14_18test3.txt")
  cat(x3, "\n")
  x4 <- scan("~/Rbook/ch14/ch14_18test4.txt", sep = ",")  
  cat(x4, "逗號是分隔符號\n")
  x5 <- scan("~/Rbook/ch14/ch14_18test2.txt", skip = 3)   
  cat(x5, "跳3欄\n")
  x6 <- scan("~/Rbook/ch14/ch14_18test2.txt", skip = 2, nlines = 1)   
  cat(x6, "跳2欄讀1欄\n")
}