x<-1:5
y<-x+3

x<-1:5
y<-x+1:10

#seq(from, to, by = width, length.out = numbers)
seq(1,9)
seq(1,9,by=2)
seq(1,9,by=0.5)

x<-c(1,3,7,2,9)

baskets.NBA2016.Lin<-c(7,8,6,11,9,12)

baskets.NBA2016.Jordon<-c(12,5,9,15,7,11)

scores.NBA2016.Lin<-baskets.NBA2016.Lin *2

total<-(baskets.NBA2016.Lin+baskets.NBA2016.Jordon)*2

baskets.both<- c(baskets.NBA2016.Lin,
                 baskets.NBA2016.Jordon)
baskets.both

x<-numeric(10)
x

x5<-"abujcudsaciudc 
ncidcoidscjoidsjcoi icdsoijcoids"
x5

baskets.NBA2016.Jordon
sum(baskets.NBA2016.Jordon)
max(baskets.NBA2016.Jordon)
min(baskets.NBA2016.Jordon)
mean(baskets.NBA2016.Jordon)

prod(1:5)

cumsum(baskets.NBA2016.Jordon)
cummax(baskets.NBA2016.Jordon)
cummin(baskets.NBA2016.Jordon)

baskets.NBA2016.Jordon
diff(baskets.NBA2016.Jordon)

sort(baskets.NBA2016.Jordon)
sort(baskets.NBA2016.Jordon,TRUE)

rank(baskets.NBA2016.Jordon)
rev(baskets.NBA2016.Jordon)

length(baskets.NBA2016.Jordon)
sd(baskets.NBA2016.Jordon)
var(baskets.NBA2016.Jordon)

var(baskets.NBA2016.Lin)

x<-c(12,45,67,89,123,NA)
sum(x)
sum(x, na.rm=TRUE)
max(x,na.rm=TRUE)

s1<-c("hello", "R", "world")

is.character(s1)

#R 內定用實數
baskets.NBA2016.Jordon
is.integer(baskets.NBA2016.Jordon)
is.double(baskets.NBA2016.Jordon)
is.numeric(baskets.NBA2016.Jordon)

str(baskets.NBA2016.Jordon)
str(s1)

class(baskets.NBA2016.Jordon)
class(s1)
x<-1:5
class(x)

x<-25:1
x
x[1]
x[3]
x[19]
x[1:3]
x[c(1,3,5,7,9)]

x[-2]
x[-c(1:15)]

letters
LETTERS

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

best.baskets <- baskets.NBA2016.Jordon > baskets.NBA2016.Lin
which(best.baskets)

which(baskets.NBA2016.Jordon > baskets.NBA2016.Lin)
baskets.NBA2016.Jordon[baskets.NBA2016.Jordon > baskets.NBA2016.Lin]
baskets.NBA2016.Jordon[which(baskets.NBA2016.Jordon > baskets.NBA2016.Lin)]

x<-c(9,1,NA,8,6)
x[!is.na(x>5)]
x[x>5 & !is.na(x)]
is.na(x>5)
x[which(!is.na(x>5))]
x[which(x>5)]

x<-c(9,1,Inf,8,6)
x[x>5]
x>5

x<-c(9,1,-Inf,8,6)
x[x>5]
x>5

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