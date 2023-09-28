#
# 實例ch13_5.R
#
ch13_5 <- function( )
{
  
  sstr <- as.character(state.region)  #轉成字串向量
  vec.income <- state.x77[, 2]        #取得各州收入
  names(vec.income) <- NULL           #刪除各州收入向量名稱
  a.income <- tapply(vec.income, factor(sstr,
        levels = c("Northeast", "South", "North Central",
                   "West")), mean)
  return(a.income)
}