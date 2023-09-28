# 
# 實例ch19_26.R
#
ch19_26 <- function ( )
{
  #繪出2個不顯示的點不加入兩軸標題；兩軸的風格"i" 
  #定義兩座標軸資料的範圍。
  plot(c(-1,-1), c(1,1), type = "n", xlab = "", ylab = "",
       xaxs = "i", yaxs = "i",xlim=c(-1.2,1.2),ylim=c(-1.2,1.2))
  #定義出正5邊形的5個點x與y座標
  x1=cos(4*pi/5);y1=sin(4*pi/5);x2=cos(2*pi/5); y2=sin(2*pi/5)
  x<-c(cos(0), x1, x2, x2,  x1)  #安排頂點時依序跳過隔壁點
  y<-c(sin(0), y1, -y2, y2, -y1) #安排頂點時依序跳過隔壁點
  #polygon(x,y,col=2,density=0) #如此僅繪製五角星型的五條線
  polygon(x,y,col=4,density=NULL)  #可以繪製內部五角型與五個角
  title("繪製一個正五角星形")
}