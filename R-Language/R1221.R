setwd("d:/rtemp")
getwd()
pkgs<-c("readr","dplyr","ggplot2")
install.packages(pkgs)
library(readr)

live <- read.csv("Live_20210128.csv", sep = ",", header = TRUE, 
                 stringsAsFactors = FALSE)
#查看資料結構和整理資料
str(live)
live1 <- data.frame(live[,c(2,4:12)])
str(live1)
attach(live1)

as.factor(live1$status_type)

#Base: 不用安裝(R既有)基本繪圖與敘述統計，及檢定
#– 載入資料: readr (csv檔), readxl(excel檔) – 繪圖: ggplot2
#– 資料操作:dplyr – 決策樹:C5.0, tree, rpart, CHAID
#– 集群分析:k-mean, hclust 在 base, fpc (kmedoids)

#四種分析
#質:status_type, status_published
#量:
#num_reactions num_comments,num_shares
#num_likes num_loves num_wows num_hahas
#num_sads num_angrys

#4種status type可以分別跑敘述性統計和dyplr平均數


#1.dplyr -資料處理
library(dplyr)
attach(live1)
live1 %>% group_by(status_type)%>%select(num_reactions)%>%
  summarise(mean(num_reactions))%>%View()

live1 %>% group_by(status_type)%>%select(num_likes)%>%
  summarise(mean(num_likes))%>%View()

live1 %>% group_by(status_type)%>%select(num_shares)%>%
  summarise(mean(num_shares))%>%View()

#2. ANOVA檢定- 變異數分析
attach(live1)
bartlett.test(num_reactions~status_type) #變異數不同質
oneway.test(num_reactions~status_type, data=live1, var.equal = FALSE)
#事後分析
library(DTK)
attach(live1)
posthoc <- with(live1, DTK.test(num_reactions, status_type))
posthoc

#3. 決策樹
install.packages("rpart")
library(rpart)
library(rpart.plot)

rptree <- rpart(status_type~num_reactions+num_likes+num_shares,
      data=live1, method="class", control=rpart.control(cp=0.001))
prp(rptree, box.palette=list("red","pink","Blues","green"))

#4. 繪圖(ggplot2)
library(ggplot2)
ggplot(data=live) + geom_point(aes(x = num_comments+num_likes+num_shares, 
      y =num_sads+num_angrys, color=status_type)) + facet_wrap(~status_type)
