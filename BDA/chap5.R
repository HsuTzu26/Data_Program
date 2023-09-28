m1<-matrix(1:12, nrow=4)
m2<-matrix(1:12, nrow=4, byrow=TRUE)
str(m1)
nrow(m1)
ncol(m2)
dim(m1)
length(m1)
is.matrix(m1)
is.matrix(m2)
is.array(m1)
is.array(m2)
v1<-c(1,3,5)
v2<-c(4,8,10)
v3<-c(5,7,2)
a1<-rbind(v1,v2)
a1
a2<-rbind(a1,v3)
a2
baskets.NBA2016.Lin<-c(7,8,6,11,9,12)
baskets.NBA2016.Jordon<-c(12,5,9,15,7,11)
baskets.team<-rbind(baskets.NBA2016.Lin,baskets.NBA2016.Jordon) 
baskets.team
v1<-c(1,3,5)
v2<-c(4,8,10)
v3<-c(5,7,2)
a3<-cbind(v1,v2)
a3
a4<-cbind(a3,v3)
a4

a2
a2[2, 1]
a2[1, 3]

dimnames(baskets.team)

m1
m2<-m1+3
m2

m1<-matrix(1:12, nrow=4, bycol=TRUE)
m2<-matrix(1:12, nrow=4, byrow=TRUE)
m3<-m1+m2
m3

m4<-m1*1:4
m4

baskets.NBA2016.Lin<-c(7,8,6,11,9,12)
baskets.NBA2016.Jordon<-c(12,5,9,15,7,11)
baskets.team<-rbind(baskets.NBA2016.Lin,baskets.NBA2016.Jordon) 
baskets.team
rowSums(baskets.team)
rowMeans(baskets.team)
colSums(baskets.team)
colMeans(baskets.team)
mean(baskets.team)
sum(baskets.team)

baskets.team
t(baskets.team)


m1<-matrix(1:12, nrow=3)
m1
m2<-m1*1:4
m2
m3<-m1 %*% 1:4
m3

diag(m1)
diag(1:5,5,5)

n3<-matrix(1:4, nrow=2)
solve(n3)

det(n3)


A = rbind(c(1, -1/4), c(-1/4, 1))
B = matrix(c(1,2), nrow=2, ncol=1)
A
B
solve(A,B)
