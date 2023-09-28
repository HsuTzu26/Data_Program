#
# 實例ch15_23.R
#
ch15_23 <- function( )
{
  i <- which(duplicated(iris))
  x <- iris[-i, ]
  print(x)
}
#
# 實例ch15_64.R
#
ch15_64 <- function( )
{
  mycar <- within(mtcars, 
                  am <- factor(am, levels = 0:1, 
                               labels = c("Auto", "Manual")))
  x <- with(mycar, tapply(mpg, am, mean))
  print(x)
}

#
# 實例ch15_65.R
#
ch15_65 <- function( )
{
  mycar <- within(mtcars, 
                  am <- factor(am, levels = 0:1, 
                               labels = c("Auto", "Manual")))
  x <- with(mycar, tapply(mpg, list(cyl, am), mean))
  print(x)
}

#
# 實例ch15_66.R
#
ch15_66 <- function( )
{
  mycar <- within(mtcars, 
                  am <- factor(am, levels = 0:1, 
                               labels = c("Auto", "Manual")))
  x <- with(mycar, aggregate(mpg, 
                             list(cyl=cyl, am=am), mean))
  print(x)
}

#
# 實例ch15_67.R
#
ch15_67 <- function( )
{
  mycar <- within(mtcars, 
                  am <- factor(am, levels = 0:1, 
                               labels = c("Auto", "Manual")))
  x <- aggregate(mpg ~ cyl + am, data = mycar, mean)
  print(x)
}

#
# 實例ch15_68.R
#
ch15_68 <- function( )
{
  balls <- data.frame(
    game = c("G1", "G2", "G3", "G4"),
    site = c("Oxford", "Lexington", "Oxford", "Lexington"),
    Lin = c(15, 9, 26, 22),
    Jordon = c(18, 32, 21, 25),
    Peter = c(10, 6, 22, 9)
  )
  print(balls)
}

install.packages("reshape2")
library("reshape2")
lballs<-melt(balls)
lballs

lballs2<-melt(balls, id.vars=c("game","site"))
lballs2

dcast(lballs, game+site~variable, sum)
dcast(lballs, variable~site, sum)
dcast(lballs, variable~site, mean)
dcast(lballs, site+variable ~game, sum)

complete.cases(airquality)
str(airquality)
x.nona<-airquality[complete.cases(airquality),]
str(x.nona)
x.nona2<-na.omit(airquality)
str(x.nona2)

x<-state.x77
popu<-state.x77[,"Population"]
xc<-cut(popu,5,labels=c("low","4th","3rd","2nd","high"))

mystate.x77<-as.data.frame(state.x77)
str(state.x77)
str(mystate.x77)

mystate.x77$name<-rownames(state.x77)
row.names(mystate.x77)<-NULL
head(mystate.x77)

mypopu.state<-mystate.x77[mystate.x77$Population>5000,c("name","Population")]
myincome.state<-mystate.x77[mystate.x77$Income>5000,c("name","Income")]
merge(mypopu.state, myincome.state)
merge(mypopu.state, myincome.state, all=TRUE)
merge(mypopu.state, myincome.state, all.x=TRUE)
merge(mypopu.state, myincome.state, all.y=TRUE)

my.index<-match(mypopu.state$name, myincome.state$name)
myincome.state[na.omit(my.index),]
my.index3<-!is.na(my.index)
mypopu.state[my.index3,]

my.index2<-mypopu.state$name %in% myincome.state$name
mypopu.state[my.index2,]

mystate.info<-data.frame(state.region, state.x77)
state.info<-mystate.info[(1:15),]
sort(state.info$Income)
order(state.info$Income)

inc.order<-order(state.info$Income)
state.info[inc.order,]
dec.order<-order(state.info$Income, decreasing=TRUE)
state.info[dec.order,]

inc.order2<-order(state.info$state.region, state.info$Income)
state.info[inc.order2,]
inc.order3<-order(state.info$state.region, -xtfrm(state.info$Income))
state.info[inc.order3,]

with(mtcars,tapply(mpg, cyl, mean))
with(mtcars,tapply(mpg,am, mean))