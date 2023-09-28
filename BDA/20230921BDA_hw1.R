#practice
color1 <- read.csv("d:/rtemp/BDA/DATA/color2023.csv", header = TRUE)
color1cluster<-color1[-4]
#color1cluster
kmeanscolor <- kmeans(color1cluster, centers = 3, nstart = 10)
plot(formula = red ~ blue, data = color1cluster, col = kmeanscolor$cluster, main = "分群", xlab = "blue", ylab = "red")
kmeanscolor$cluster
colorresult<-cbind(color1,kmeanscolor$cluster)
colorresult

#self
color1 <- read.csv("d:/rtemp/BDA/DATA/color.csv", header = TRUE)
color1cluster<-color1[-7]
#color1cluster
kmeanscolor <- kmeans(color1cluster, centers = 3, nstart = 10)
plot(formula = red ~ white, data = color1cluster, col = kmeanscolor$cluster, main = "分群", xlab = "blue", ylab = "red")
kmeanscolor$cluster
colorresult<-cbind(color1[-8],kmeanscolor$cluster)
colorresult