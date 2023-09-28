#
# 實例ch11_14.R
#
x <- 1:8                 #設定全域變數
print("執行函數前")
print(x)                 #列印全域變數x
test <- function(y)      
{
  print("進入函數")
  x <- y
  print(x)               #列印區域變數x
  print("離開函數")
}
test(1:5)                #呼叫函數
print("執行函數後")
print(x)                 #列印全域變數