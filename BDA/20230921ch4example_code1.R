# 20230921 practice
# vector
x<-1:5
y<-x+3

x<-1:5
y<-x+ 1:10
y

# seq
seq(1,9)
seq(1,9, by=2)
seq(1,9, by=0.5)
seq(1,9, by=pi)
seq(1,9, length.out = 5)

# c concatenate method
x<-c(1, 3, 7, 2, 9)
x

x<-numeric(10)
x

###################################

baskets.NBA2016.Lin<-c(7,8,6,11,9,12)

baskets.NBA2016.Jordon<-c(12,5,9,15,7,11)

scores.NBA2016.Lin<-baskets.NBA2016.Lin *2

total<-(baskets.NBA2016.Lin+baskets.NBA2016.Jordon)*2

baskets.both<- c(baskets.NBA2016.Lin,
                 baskets.NBA2016.Jordon)
baskets.both

x5<-"abujcudsaciudc 
ncidcoidscjoidsjcoi icdsoijcoids"
x5

sum(baskets.NBA2016.Jordon)
max(baskets.NBA2016.Jordon)
min(baskets.NBA2016.Jordon)
mean(baskets.NBA2016.Jordon)

sort(baskets.NBA2016.Jordon)
sort(baskets.NBA2016.Jordon,TRUE)

rank(baskets.NBA2016.Jordon)
rev(baskets.NBA2016.Jordon)

length(baskets.NBA2016.Jordon)
sd(baskets.NBA2016.Jordon)
var(baskets.NBA2016.Jordon)

var(baskets.NBA2016.Lin)

x<-c(12,45,67,89,123,NA)
sum(x, na.rm=TRUE)
max(x,na.rm=TRUE)

s1<-c("hello", "R", "world")

is.character(s1)

a1<-letters[1:10]

a2<-letters[11:20]

n_list<-25:1

n_list[c(5,15,20)]

baskets.NBA2016.Jordon>10

which(baskets.NBA2016.Jordon>10)
which.max(baskets.NBA2016.Jordon)
which.min(baskets.NBA2016.Jordon)

sum(baskets.NBA2016.Jordon>10)

baskets.NBA2016.Jordon > baskets.NBA2016.Lin
sum(baskets.NBA2016.Jordon > baskets.NBA2016.Lin)

which(baskets.NBA2016.Jordon > baskets.NBA2016.Lin)
baskets.NBA2016.Jordon[baskets.NBA2016.Jordon > baskets.NBA2016.Lin]
baskets.NBA2016.Jordon[which(baskets.NBA2016.Jordon > baskets.NBA2016.Lin)]

x<-c(9,1,NA,8,6)



which(baskets.NBA2016.Lin>baskets.NBA2016.Jordon)

any(baskets.NBA2016.Lin>baskets.NBA2016.Jordon)

all(baskets.NBA2016.Lin>baskets.NBA2016.Jordon)


month.data<-c(31,28,31,30,31,30,31,31,30,31,30,31)

names(month.data)<-month.name

names(month.data[month.data==31])

names(month.data[month.data==30])



newislands<-sort(islands, decreasing = TRUE)

small10.islands<-tail(sort(islands, decreasing = TRUE),10)

big10.islands<-names(head(sort(islands, decreasing = TRUE),10))

big10.islands<-names(sort(islands, decreasing = TRUE)[1:10])