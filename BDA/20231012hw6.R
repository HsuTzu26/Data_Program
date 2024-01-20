#mit.Name <-c("Kevin","Peter","Frank","Meggie")
#mit.Gender <-c("M","M","M","F")
#mit.Height <-c(170,175,165,168)
#mit.info <-data.frame(mit.Name, mit.Gender, mit.Height, stringsAsFactors = FALSE)

#將 mit.info 增加新欄位: $weight, $age, $score
#再多增加三位學生資料，最後:
  
#  mit.Name mit.Gender mit.Height Weight Age Score
#1    Kevin          M          170          65        19    88
#2    Peter          M           175         71        20    91
#3    Frank          M          165          58        20    75
#4   Meggie          F         168          55        19    80
#5      Amy          F           161          58        20    95
#6    Roger          M         181          78        19    87
#7     Mary          F           171          57        18    93

#1. 列出女性(F)的資料
#2. 列出男性(M)，且體重超過70的資料
#3. 列出年齡是18或19歲的人的資料
#4. 列出成績大於80分的人的資料


##################################
# 初始資料
mit.Name <- c("Kevin", "Peter", "Frank", "Meggie")
mit.Gender <- c("M", "M", "M", "F")
mit.Height <- c(170, 175, 165, 168)

# 創建 mit.info 資料框
mit.info <- data.frame(
  Name = mit.Name, 
  Gender = mit.Gender, 
  Height = mit.Height, 
  stringsAsFactors = FALSE)

# 添加新欄位 weight, age, score
mit.info$Weight <- c(73, 65, 68, 53)
mit.info$Age <- c(19, 20, 20, 19)
mit.info$Score <- c(83, 90, 72, 98)

# 新增三位學生資料
new_students <- data.frame(
  Name = c("Asala", "Novi", "Toku"),
  Gender = c("F", "F", "M"),
  Height = c(160, 157, 160),
  Weight = c(58, 42, 57),
  Age = c(20, 19, 18),
  Score = c(99, 86, 67),
  stringsAsFactors = FALSE
)

# 合併新學生資料到 mit.info
mit.info <- rbind(mit.info, new_students)


#1. 列出女性(F)的資料
female_data <- mit.info[mit.info$Gender == "F", ]
female_data

#2. 列出男性(M)，且體重超過70的資料
male_over_data <- mit.info[mit.info$Gender == "M" & mit.info$Weight >70, ]
male_over70_data

#3. 列出年齡是18或19歲的人的資料
age_18_19_data <- mit.info[(mit.info$Age == 18) | (mit.info$Age == 19), ]
age_18_19_data

#4. 列出成績大於80分的人的資料
score_over_80_data <- mit.info[mit.info$Score > 80,]
score_over_80_data

#####################################
#%in$ example
# 創建兩個向量
vector1 <- c(1, 2, 3, 4, 5)
vector2 <- c(3, 5, 7)

# 使用 %in% 測試 vector1 中的元素是否包含在 vector2 中
result <- vector1 %in% vector2

# 結果是一個布林向量，指示每個元素是否存在於 vector2 中
print(result)
# [1]  FALSE FALSE  TRUE FALSE  TRUE

