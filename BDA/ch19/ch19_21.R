# 
# 實例ch19_21.R
#
#bivariate normal pdf with tho=0.5
f <- function(x,y){
  exp(-2/3*(x^2-x*y+y^2))/pi/sqrt(3)
}
ch19_21 <- function ( ){
x<-seq(-3,3,0.1); y <- x  #設定 x與y在-3與3倍標準差內
z <- outer(x,y,f)     #使用外積函數產生 z 值
#繪製2*2四合一圖 設定下左上右留空
par(mfrow=c(2,2),mai=c(0.3,0.2,0.3,0.2))
persp(x,y,z,main="透視圖") #透視圖(左上)；下一张圖調整角度與方向(右上)
persp(x,y,z,theta=60,phi=30,box=T,main="theta=60,phi=30,box=T")
contour(x,y,z,main="等高線圖") #等高線圖(左下)
image(x,y,z,main="色彩影像圖")   #色彩影像圖(右下)
}