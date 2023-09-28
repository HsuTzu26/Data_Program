# 
# 實例ch19_23.R
#
ch19_23 <- function ( )
{
  attach(crabs)             #使用crabs數據框
  FLmax.id <- which.max(FL) #找出FL最大值的位置
  FLmin.id <- which.min(FL) #找出FL最小值的位置
  oset <- 3                 #偏移量
  plot(FL,CL)      #繪製FL VS CL的散佈圖
  #繪製FL最大值的點， 在該點寫下說明文字　
  points(FL[FLmax.id],CL[FLmax.id],col=2,cex=2)
  text(FL[FLmax.id]-oset,CL[FLmax.id],col=2,
       label=as.character(FLmax.id),adj=0.5)
  #繪製FL最小值的點， 在該點寫下說明文字
  points(FL[FLmin.id],CL[FLmin.id],col=2,cex=2)
  text(FL[FLmin.id],CL[FLmin.id],col=2,
       label=as.character(FLmin.id),pos=2,offset=-oset)
  text(min(FL)+oset,max(CL)-oset,label="標示出最大及最小的FL點")
}