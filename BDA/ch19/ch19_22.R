# 
# 實例ch19_22.R
#
ch19_22 <- function ( )
{
#繪出六個不顯示的點不加入兩軸標題；兩軸的風格"i" (internal)
#是查找原始資料範圍內適合最佳標籤與座標軸。
  plot(c(0,6), c(0,6), type = "n", xlab = "", ylab = "",
       xaxs = "i", yaxs = "i")
#繪出6*6 36個格點及線
  grid(6, 6, lty = 1)
  title("plot 25 points from 1 to 25") 
#在相對位置上以25種符號與顏色；文字放大4倍
  for(i in 0:24) try(points(1+i%%5, 1+i%/%5,
                            pch = i+1,col=i+1,cex=4))
}