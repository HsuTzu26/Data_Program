# 氣溫與冰紅茶銷量 
#significance
#先做一個變數的例子
temperature <- c(29, 28, 34, 31, 25, 29, 32, 31, 24, 33, 25, 31, 26, 30)
icedTeaSales <- c(77, 62, 93, 84, 59, 64, 80, 75, 58, 91, 51, 73, 65, 84)
#做預測
toBePredicted <- data.frame(temperature = c(28,30), sweet=c(12.5, 18.5))
#並畫圖 2D
plot(temperature, icedTeaSales,
     xlab = "Temperature", ylab = "Iced Tea Sales",
     main = "2D Scatterplot of Temperature and Iced Tea Sales")

plot(icedTeaSales ~ temperature, main="title", xlab="x",ylab="y")
points(x=toBePredicted$temperature, y=predicted, col="green",cex=2,pch=18)
abline(reg = lmIcedTea$coefficients, col="red", lwd=2)


### Start ###
# 數據
temperature <- c(29, 28, 34, 31, 25, 29, 32, 31, 24, 33, 25, 31, 26, 30)
icedTeaSales <- c(77, 62, 93, 84, 59, 64, 80, 75, 58, 91, 51, 73, 65, 84)

# 創建 2D 散點圖
plot(icedTeaSales ~ temperature, main = "冰紅茶銷量與氣溫", xlab = "氣溫", ylab = "冰紅茶銷量")

#進行線性回歸
lmIcedTea <- lm(icedTeaSales ~ temperature)

#添加回歸線
abline(lmIcedTea, col = "red", lwd = 2)

#做預測
toBePredicted <- data.frame(temperature = c(28, 30))
predicted <- predict(lmIcedTea, newdata = toBePredicted)

#在圖中標記預測點
points(toBePredicted$temperature, predicted, col = "green", pch = 18, cex = 2)

###significance level α ###
summary(lmIcedTea)
### End ###

### Start ###
#然後加上甜度:
temperature <- c(29, 28, 34, 31, 25, 29, 32, 31, 24, 33, 25, 31, 26, 30)
icedTeaSales <- c(77, 62, 93, 84, 59, 64, 80, 75, 58, 91, 51, 73, 65, 84)
sweetness <- c(19, 12, 23, 21, 11, 15, 19, 14, 11, 23, 12, 11, 13, 22)

#做預測
toBePredicted <- data.frame(temperature = c(28,30), sweet=c(12.5, 18.5))

###1. scatterplot3d
### 比較簡單快速, 但功能較為基礎
library(scatterplot3d)
### 原始數據
s3d <- scatterplot3d(temperature, sweetness, icedTeaSales,
                     color = "blue",
                     pch = 16,
                     main = "3D Scatterplot of Temperature, Sweetness, and Iced Tea Sales",
                     xlab = "Temperature",
                     ylab = "Sweetness",
                     zlab = "Iced Tea Sales")
### 預測點
s3d$points3d(toBePredicted$temperature, toBePredicted$sweet, predict(lmIcedTea, newdata = toBePredicted),
             col = "red", 
             pch = 18, 
             cex = 1.5) 
#########


###2. rgl
### 交互性 可旋轉、縮放, 但通常需要在R的特定視窗看(會彈跳出來)
#install.packages("rgl")
library(rgl)

#創建交互式 3D 散點圖
plot3d(temperature, sweetness, icedTeaSales, type = "s", size = 2,
       xlab = "x", ylab = "y", zlab = "count",
       main = "3D Scatterplot of Temperature, Sweetness, and Iced Tea Sales")
#########

###3. plotly
### 可交互式圖形、可視效果好、支援很多功能
### 不過需要寫更多 code 來實現圖形
library(plotly)

# 數據
temperature <- c(29, 28, 34, 31, 25, 29, 32, 31, 24, 33, 25, 31, 26, 30)
icedTeaSales <- c(77, 62, 93, 84, 59, 64, 80, 75, 58, 91, 51, 73, 65, 84)
sweetness <- c(19, 12, 18, 21, 11, 15, 16, 12, 11, 23, 12, 11, 13, 22)

# 創建數據框
data <- data.frame(temperature, sweetness, icedTeaSales)

# 創建 3D 散點圖
plot_3d <- plot_ly(data, x = ~temperature, y = ~sweetness, z = ~icedTeaSales, type = "scatter3d", mode = "markers",
                   marker = list(size = 5, color = "blue")) %>%
  layout(scene = list(xaxis = list(title = "Temperature"),
                      yaxis = list(title = "Sweetness"),
                      zaxis = list(title = "Iced Tea Sales")))

# 執行線性回歸
lmIcedTea <- lm(icedTeaSales ~ temperature + sweetness, data = data)

# 輸出回歸係數
summary(lmIcedTea)

# 繪製回歸平面
plot_regression <- plot_ly() %>%
  add_trace(data = data, x = ~temperature, y = ~sweetness, z = ~icedTeaSales, 
            type = "scatter3d", mode = "markers", 
            marker = list(size = 5, color = "blue")) %>%
  add_trace(data = data.frame(temperature = temperature,
                              sweetness = sweetness,
                              icedTeaSales = predict(lmIcedTea)),
            x = ~temperature, y = ~sweetness, z = ~icedTeaSales, type = "surface",
            surfacecolor = ~icedTeaSales, colorscale = "Viridis") %>%
  layout(scene = list(xaxis = list(title = "Temperature"),
                      yaxis = list(title = "Sweetness"),
                      zaxis = list(title = "Iced Tea Sales")))
### End ###


# 輸出3D 散點圖和回歸平面
plotly::subplot(plot_3d, plot_regression)

#########