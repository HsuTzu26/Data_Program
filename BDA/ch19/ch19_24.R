# 
# 實例ch19_24.R
#
ch19_24 <- function ( )
{
  #繪出六個不顯示的點不加入兩軸標題；兩軸的風格"i" (internal)
  #是查找原始資料範圍內適合最佳標籤與座標軸。
  plot(c(0,6), c(0,6), type = "n", xlab = "", ylab = "",
       xaxs = "i", yaxs = "i")
  #繪出6*6 36個格點及線
  grid(6, 6, lty = 1)
  #以lines函數繪製兩條線
  lines(c(1,5),c(2,2),col=4,lwd=4)
  lines(c(1,5),c(4,4),col=5,lwd=5)
  #以segments函數繪製兩條線
  segments(1,2,1,4,col=3,lwd=3)
  segments(5,2,5,4,col=2,lwd=2)
  #以向量提供x, y兩個4向量
  x<-c(2,2,4,4); y <- c(1,5,1,5)
  s <- seq(length(x) -1)
  #繪製三段箭頭
  arrows(x[1],y[1],x[2],y[2],col=1, 
         lwd=2, angle=30,code=1)
  arrows(x[2],y[2],x[3],y[3],col=2, 
         lwd=4, angle=60,code=2)
  arrows(x[3],y[3],x[4],y[4],col=3, 
         lwd=6, angle=90,code=3)
  title("使用lines, segments與arrows \n 三函數來繪製線段")
}