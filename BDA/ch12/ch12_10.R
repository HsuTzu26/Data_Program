#
# 實例ch12_10.R
#
ch12_10 <- function(x)
{
   if (x == 0)                   #終止條件
     x_sum = 1    
   else 
     x_sum = x * ch12_10(x - 1)  #遞廻呼叫
     return (x_sum)
}