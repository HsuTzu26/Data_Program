s1<-c(86,90,78)
s2<-c(78,67,90)
s3<-c(80,88,94)
student.score<-rbind(s1,s2,s3)
colnames(student.score)<-c("chinese","english","math")
student.score

# 輸出結果 outpout
# 
# chinese english math total  average
# s1      86      90     78     254    84.67
# s2      78      67     90     235    78.33
# s3      80      88     94     262    87.33
sBind <- rbind(s1,s2,s3)
total <- rowSums(sBind)
average <- round(rowMeans(sBind),2)
Stu <- cbind(sBind,total,average)
colnames(Stu)<-c("chinese","english","math", "total", "average")
Stu




##########
total = rowSums(student.score)
average = round(rowMeans(student.score),2)
sudent.score = cbind(student.score, total, average)
