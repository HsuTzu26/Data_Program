# 
# 實例ch19_16.R
#
mynorm2 <- function(x,XX){
  mu <- mean(XX)
  s <- sd(XX)
  exp(-1/2*(x-mu)^2)/sqrt(2*pi)/s
}
ch19_16 <- function ( ) {
#計算出crabs數據框的最小與最大值
min <- min(crabs[,4:8]); max <-max(crabs[,4:8])
#繪出第一個變數FL的常態分配密度函數圖
curve(mynorm2(x,crabs$FL),min, max,ylim=c(0,0.15),
      lty=1,col=1,add=FALSE)
#在圖上持續加上RW,CL,CW BD等四個變數的常態分配密度函數圖
curve(mynorm2(x,crabs$RW),min, max,lty=2,col=2,add=TRUE)
curve(mynorm2(x,crabs$CL),min, max,lty=3,col=3,add=TRUE)
curve(mynorm2(x,crabs$CW),min, max,lty=4,col=4,add=TRUE)
curve(mynorm2(x,crabs$BD),min, max,lty=5,col=5,add=TRUE)
#加入圖例說明，以利比較了解
legend(35,0.15,legend=names(crabs)[4:8],col=1:5,lty=1:5,
       cex=1)
title(main="crabs數據框5個數值變數的比較",sub="大小(mm)")
}