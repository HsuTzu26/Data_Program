#請做第六章
#實作題第三題
#st1<-c("A","B","C","D","F","C","A","B","C","F","D","A","B","C","A","D","F","A","B","C")
#直接設定 ABCD F的成績就好，不用管分數。

# Assume the exam scores data
#scores <- c("B", "A", "C", "B", "D", "A", "C", "C", "B", "F", "D", "B", "A", "C", "D", "A", "B", "C", "F", "A")
# Create an ordered factor
#score_factor <- factor(scores, ordered = TRUE, levels = c("F", "D", "C", "B", "A"))


# Assume the exam scores data
scores <- c(85, 92, 78, 89, 60, 94, 73, 79, 88, 55, 68, 87, 95, 77, 65, 91, 86, 75, 45, 98)
scores

# Create an ordered factor based on the score ranges
score_factor <- cut(scores, breaks = c(0, 59, 69, 79, 89, 100),
                    labels = c("F", "D", "C", "B", "A"), ordered = TRUE)
score_factor

#a. 請列出成績 B 以上的人
scores_B_or_above <- score_factor[score_factor > "B"]
scores_B_or_above

#b. 請列出成績 F 的人
scores_F <- score_factor[score_factor == "F"]
scores_F

#c. 請使用 table( ) 函數瞭解個成績的分佈
score_distribution <- table(score_factor)
score_distribution
