#請執行下面有關 R apply family 的練習
#有八題，答案都有提供，請完成所有的題目，包括圖形輸出。
#---------------------------------------------------------------
#Question 1 簡單的練習
#a. Get the following matrix of 5 rows and call it ‘mymatrix’
# 建立一個 5 rows matrix 並放入數據 
mymatrix = matrix(data = c(6,34,923,5,0, 112:116, 5,9,34,76,2, 545:549), nrow = 5)
mymatrix

#b. Get the mean of each row
# 取得每個row的平均
apply(mymatrix, 1,mean)
#apply(mymatrix, MARGIN = 1, FUN = mean)
#expected result
[1] 167.00 175.50 404.50 186.00 166.75

#c. Get the mean of each column
# 取得每個column的平均
apply(mymatrix, 2, mean)
#apply(mymatrix, MARGIN = 2, FUN = mean)
#expected result
[1] 193.6 114.0 25.2 547.0

#d. Sort the columns in ascending order
# 用升冪排序每個column
apply(mymatrix, 2,sort)
#apply(mymatrix, MARGIN = 2, FUN = sort)
#expected result

[,1] [,2] [,3] [,4]
[1,]   0  112    2  545
[2,]   5  113    5  546
[3,]   6  114    9  547
[4,]  34  115   34  548
[5,] 923  116   76  549

#-------------------------------------------------------
#Question 2 Using ‘lapply’ on a data.frame ‘mtcars’
#a. Use three ‘apply’ family functions to get the minimum values of each column of the ‘mtcars’ dataset (hint: ‘lapply’, ‘sapply’, ‘mapply’).
#
#Store each output in a separate object (‘l’, ‘s’, ‘m’) and get the outputs.
# lapply 使用min函數對mtcars的每個元素進行操作
# 返回一個 result list
l <- lapply(mtcars, FUN = min)
# sapply 使用min函數對mtcars的每個元素進行操作
# 並對結果進行 simpilfy, 返回一個向量
s <- sapply(mtcars, FUN = min)
# mapply
# mapply 使用min函數對mtcars的每個元素進行操作
# 返回一個向量
# ##將多個列表的對應元素進行逐一處理，並且可以處理多個參數的情況
m <- mapply(mtcars, FUN = min)
l; s; m

#b. Put the three outputs ‘l’, ‘s’, ‘m’ in the list ‘listobjects’
# 將lapply, sapply, mapply的結果合併, 轉為list type
listobjects <- list(l,s,m)
#c. Use a suitable ‘apply’ function to get the class of each of the three list elements in ‘listobjects’
# 對listobjects 進行 sapply, 取得三個結果的 class
sapply(listobjects,class)
#sapply(FUN = class, X = listobjects)
#d. Name the output classes for each of the three functions used in the exercise
#'lapply' gives a list,
#'sapply' and 'mapply' give vectors per default

#-------------------------------------------------------------
#3. Titanic Casualties – 
#Use the standard ‘Titanic’ dataset which is part of R Base
#a. Use an appropriate apply function to get the sum of males vs females aboard.
# 對males和females的人數進行加總, 無論存活及死亡
apply(Titanic, 2, sum)

#expected result
Male Female 
1731 470 

#b. Get a table with the sum of survivors vs sex.
# 取得一個table顯示存活與性別的人數
apply(Titanic, c(2,4), sum)
#expected result

Survived
Sex     No Yes
Male  1364 367
Female 126 344
#c. Get a table with the sum of passengers by sex vs age.
# 取得一個 年齡與性別的人數加總列表
apply(Titanic, c(3,2), sum)
#expected result

Sex
Age  Male Female
Child    64     45
Adult  1667    425

#-----------------------------------------------------------
#Question 4. Extracting elements from a list of matrices with ‘lapply’
#a. Create ‘listobj’ which is a list of four matrices – see data:
# 建立一個listobj 並將 first, secon, third, fourth 四個 matrices放入list
first = matrix(38:66, 3)
second = matrix(56:91, 3)
third = matrix(82:145, 3)
fourth = matrix(46:93, 5)
listobj = list(first, second, third, fourth)

#b. Extract the second column from the list of matrices (from each single matrix).
# 為從 listobj 列表中的每個矩陣中提取第二列的方法
# 使用 lapply 函數將 "[" 函數應用於 listobj 中的每個矩陣
# 然後使用 2 作為索引來提取第二列
lapply(listobj,"[", , 2)

###"[" 是 R 語言中用於子集資料的函數。
###"[" 可以用於從向量、矩陣、資料框等資料結構中選擇特定的元素或子集。
#expected result

[[1]]
[1] 41 42 43

[[2]]
[1] 59 60 61

[[3]]
[1] 85 86 87

[[4]]
[1] 51 52 53 54 55

#c. Extract the third row from the list of matrices.
# 為從 listobj 列表中的每個矩陣中提取第三列的方法
lapply(listobj,"[", 3 , )
#expected result

[[1]]
[1] 40 43 46 49 52 55 58 61 64 38

[[2]]
[1] 58 61 64 67 70 73 76 79 82 85 88 91

[[3]]
[1] 84 87 90 93 96 99 102 105 108 111 114 117 120 123 126 129 132 135 138 141 144 83

[[4]]
[1] 48 53 58 63 68 73 78 83 88 93

#-----------------------------------------------------------
#Question 5: Plotting with the ‘apply’ family. Use the dataset ‘iris’ from R Base.
#a. Get a boxplot for each numerical column of the ‘iris’ dataset (four boxplots).
apply(iris[,1:4], 2, boxplot)


#b. The package ‘vioplot’ has a useful function ‘vioplot’ for violin plots 
#(hint: install and activate package). Get one violin plot for each numeric 
#column, remove any numbers from the x axis, color = salmon
#需要下載 package vioplot
install.packages("vioplot")
library(vioplot)
apply(iris[,1:4], 2, vioplot, col = "salmon", names = "")
## 獲得四個小提琴圖，每個圖代表一個連續變量的分佈情況，
# 顏色設定為"salmon"（深紅色），並且不顯示組的名稱。
# 比較不同變量之間的分佈情況。
$Sepal.Length
$Sepal.Length$upper
[1] 7.9

$Sepal.Length$lower
[1] 4.3

$Sepal.Length$median
[1] 5.8

$Sepal.Length$q1
[1] 5.1

$Sepal.Length$q3
[1] 6.4


$Sepal.Width
$Sepal.Width$upper
[1] 4.05

$Sepal.Width$lower
[1] 2.05

$Sepal.Width$median
[1] 3

$Sepal.Width$q1
[1] 2.8

$Sepal.Width$q3
[1] 3.3


$Petal.Length
$Petal.Length$upper
[1] 6.9

$Petal.Length$lower
[1] 1

$Petal.Length$median
[1] 4.35

$Petal.Length$q1
[1] 1.6

$Petal.Length$q3
[1] 5.1


$Petal.Width
$Petal.Width$upper
[1] 2.5

$Petal.Width$lower
[1] 0.1

$Petal.Width$median
[1] 1.3

$Petal.Width$q1
[1] 0.3

$Petal.Width$q3
[1] 1.8




#-----------------------------------------------------------
#Question 6. Using the ‘apply’ family to work with classes of data.frames

#a. Find out which column of iris is not numeric.
# 取得iris dataset中不為numeric class 的列表索引值
which(sapply(iris, class) != "numeric")
#b. Identify the levels of the non-numeric column (hint: ‘levels’ function).
# 獲取 Species列的 level
levels(iris$Species)
#c. Try the function “unique” instead, compare the output.
# 比較 Species列的 level
unique(iris$Species)
#"levels" gets you character outputs which are easier to work with, "unique" gets you the original factors

#-----------------------------------------------------------
#Question 7. Use library ‘ggplot2’, dataset = ‘diamonds’ (hint: install and activate package)
#a. Load the library ‘ggplot2’, and dataset ‘diamonds’.
#ggplot2 應該本來就有安裝
library(ggplot2)

#b. Which columns are not numeric in class?.
# 取得diamonds dataset中不為numeric class 的列表索引值
which(sapply(diamonds, class) != "numeric")

#c. For observations 10000 to 11000, get the mean of columns 8, 9, 10.
# 設定 10,000~11,000的觀察值, 分別取得第8~10列的平均值
apply(diamonds[10000:11000, 8:10], 2, mean)

#d. Same as ‘c’ but round the results to one digit.
# 如上題解釋, 但加入round 取到小數第一位
round(apply(diamonds[10000:11000, 8:10], 2, mean),1)

#e. Sort the rounded results in ascending order.
# 將上題結果進行升冪排序
sort(round(apply(diamonds[10000:11000, 8:10], 2, mean),1))

#------------------------------------------------------------
#Question 8. Function ‘aggregate’
#a. Use ‘aggregate’ on ‘mtcars’. Calculate the median for each column sorted by the number of carburetors. Use the standard ‘x’, ‘by’ and ‘FUN’ arguments.
# 使用 aggregate 函數來計算 mtcars 數據集中每個列的中位數，
# 並根據carburetors（carb）的數量進行分組
aggregate(x = mtcars, by = list(mtcars$carb), FUN = median)
#expected result

Group.1   mpg cyl   disp  hp  drat    wt   qsec  vs am gear carb
1       1 22.80   4 108.00  93 3.850 2.320 19.470 1.0  1  4.0    1
2       2 22.10   4 143.75 111 3.730 3.170 17.175 0.5  0  4.0    2
3       3 16.40   8 275.80 180 3.070 3.780 17.600 0.0  0  3.0    3
4       4 15.25   8 350.50 210 3.815 3.505 17.220 0.0  0  3.5    4
5       6 19.70   6 145.00 175 3.620 2.770 15.500 0.0  1  5.0    6
6       8 15.00   8 301.00 335 3.540 3.570 14.600 0.0  1  5.0    8

#b. Calculate again the median based on ‘carb’, but this time use the ‘formula-dot’ notation.
# 使用 aggregate 函數根據 carb 列的值，計算每個列的中位數
aggregate(. ~ carb, data = mtcars, median)
#expected result

carb   mpg cyl   disp  hp  drat    wt   qsec  vs am gear
1    1 22.80   4 108.00  93 3.850 2.320 19.470 1.0  1  4.0
2    2 22.10   4 143.75 111 3.730 3.170 17.175 0.5  0  4.0
3    3 16.40   8 275.80 180 3.070 3.780 17.600 0.0  0  3.0
4    4 15.25   8 350.50 210 3.815 3.505 17.220 0.0  0  3.5
5    6 19.70   6 145.00 175 3.620 2.770 15.500 0.0  1  5.0
6    8 15.00   8 301.00 335 3.540 3.570 14.600 0.0  1  5.0