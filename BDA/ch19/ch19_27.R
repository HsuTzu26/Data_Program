# 
# 實例ch19_27.R
#
ch19_27 <- function (x0=-3, xn=3, np=100 )
{
  #給與標準常態分配pdf、起點、終點、過程點個數，就能繪製
    inc=(xn-x0)/np  # 根據過程點數計算出 增量
    mid.p=seq(x0, xn, by=inc)
    x.allp= c(x0, mid.p      ,xn)  #多加入x首尾兩點座標
    y.allp= c( 0, dnorm(mid.p), 0) #多加入y首尾兩點座標均為0
    curve(dnorm,-3.5,3.5) #常態分配取-3.5至3.5之間
    abline(h=0)  #繪製y=0的水平線
    polygon(x.allp,y.allp,density=500, angle=90)
    title(paste("常態分配在x0=",x0,"\n 與xn=",xn,"間的面積"))
}