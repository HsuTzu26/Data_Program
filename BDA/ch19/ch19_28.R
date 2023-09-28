# 
# 實例ch19_28.R
#
ch19_28 <- function ( )
{
  plot(1:4,axes=FALSE)#僅繪圖不標示軸線
  #在圖的右端加上中文標籤
  axis(4,at=1:4,labels=c("ㄧ","二","三","四"))
  #在圖的上端加上英文字標籤
  axis(3,at=1:4,
       labels=c("one","two","three","four"))
  #在(2,1)的位置上，下方繪製給定顏色的水平座標軸
  axis(1,pos=c(2,1),col=2,col.ticks=3)
  #在(1.5,1)的位置上，左方繪製給定顏色的垂直座標軸
  axis(2,pos=c(1.5,1),col=4,col.ticks=5)
}