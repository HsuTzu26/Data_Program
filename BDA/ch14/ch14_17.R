#
# 實例ch14_17.R
#
ch14_17 <- function( )
{
  cat("請輸入數值資料，若想結束輸入，可直接按Enter")
  x1 <- scan()
  cat(x1, "\n")
  cat("請輸入字元資料，若想結束輸入，可直接按Enter")
  x2 <- scan(what = character())
  cat(x2)
}