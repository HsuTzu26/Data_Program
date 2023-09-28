#
# 實例ch13_1.R
#
ch13_1 <- function( )
{
  an_info <- matrix(c(8, 9, 6, 5, 7, 2, 10, 6, 8), ncol = 3)
  colnames(an_info) <- c("Tiger", "Lion", "Leopard")
  rownames(an_info) <- c("Day 1", "Day 2", "Day 3")
  print(an_info)                  #列印3天動物觀察數據
  apply(an_info, 2, max)          #列出各動物最大出現次數
}
#
# 實例ch13_2.R
#
ch13_2 <- function( )
{
  an_info <- matrix(c(8, NA, 6, 5, 7, 2, 10, 6, 8), ncol = 3)
  colnames(an_info) <- c("Tiger", "Lion", "Leopard")
  rownames(an_info) <- c("Day 1", "Day 2", "Day 3")
  print(an_info)                  #列印3天動物觀察數據
  apply(an_info, 2, max)          #列出各動物最大出現次數
}
#
# 實例ch13_3.R
#
ch13_3 <- function( )
{
  an_info <- matrix(c(8, NA, 6, 5, 7, 2, 10, 6, 8), ncol = 3)
  colnames(an_info) <- c("Tiger", "Lion", "Leopard")
  rownames(an_info) <- c("Day 1", "Day 2", "Day 3")
  print(an_info)                        #列印3天動物觀察數據
  apply(an_info, 2, max, na.rm = TRUE)  #列出各動物最大出現次數
}
# 
# 實例ch13_4.R
#
deginfo<-c(80,80,200,200)
custinfo<-c("goverment","company", "company","family")
ch13_4(deginfo, custinfo)
ch13_4 <- function( deg, customer, unitPrice = 50 )
{
  listprice <- deg * unitPrice * 
    ifelse (deg > 150, 0.8, 1)       #原始電費
  adj <- sapply(customer, switch, goverment = 0.8, company = 1.2, 1)
  finalprice <- listprice * adj      #最終電費
  round(finalprice)                  #電費取整數
}
# 
# 實例ch12_19.R
#
ch12_19 <- function( deg, customer, unitPrice = 50 )
{
  listprice <- deg * unitPrice * 
    ifelse (deg > 150, 0.8, 1)       #原始電費
  adj <- numeric(0)
  for ( i in customer) {
    adj <- c(adj, switch(i, goverment = 0.8, company = 1.2, 1))
  }
  finalprice <- listprice * adj      #最終電費
  round(finalprice)                  #電費取整數
}
#chapter7
m.name<-c("kevin", "peter", "frank", "maggie")
m.gender <- c("M","M","M","F")
m.height <- c(170, 175, 165, 168)
m.info <- data.frame(m.name, m.gender, m.height, stringsAsFactors = FALSE)
names(m.info) <- c("name","gender","height")
m.info<-rbind(m.info, c("amy","F",161))
m.newinfo<-data.frame(name=c("tony","julis"), gender=c("M","F"), height=c(171,163))
m.newinfo2<-rbind(m.info, m.newinfo)
weight <- c(77,65,67,57, 58)
m.info$weight <- weight
#chap13, page13-7
sapply(m.info,class)
sapply(m.info,unique)
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