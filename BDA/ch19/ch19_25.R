# 
# 實例ch19_25.R
#
ch19_25 <- function ( )
{
  #繪出2個不顯示的點不加入兩軸標題；兩軸的風格"i" 
  #定義兩座標軸資料的範圍。
  plot(c(-1,-1), c(1,1), type = "n", xlab = "", ylab = "",
       xaxs = "i", yaxs = "i",xlim=c(-1.2,1.2),ylim=c(-1.2,1.2))
  co30=sqrt(3)/2;  #計算 cos(30度)另外 sin(30度)= 1/2
  #定義出正六邊形的六個點x與y座標
  x<-c(co30, 0, -co30, -co30,  0, co30)
  y<-c(0.5 , 1,   0.5,  -0.5, -1, -0.5)
  polygon(x,y,col=2 ,density=0)
  title("繪製一個正六邊形") 
}