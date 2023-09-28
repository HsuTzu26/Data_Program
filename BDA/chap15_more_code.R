state.x77
state.region
mystate.info<-data.frame(region=state.region, state.x77)
state.info<-mystate.info[1:15,]
order(state.info$Income)
order(state.info$Income, decreasing=TRUE)

inc.order<-order(state.info$Income)
state.info[inc.order,]

dec.order<-order(state.info$Income, decreasing=T)
state.info[dec.order,]

inc.order2<-order(state.info$region, state.info$Income)
state.info[inc.order2,]

dec.order2<-order(state.info$region, state.info$Income, decreasing=T)
state.info[dec.order2,]

mix.order<-order(state.info$region, -xtfrm(state.info$Income))
state.info[mix.order,]

mtcars
with(mtcars, tapply(mpg, cyl,mean))

with(mtcars, tapply(mpg, am,mean))

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


list(mtcars$cyl, mtcars$am)


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

lballs<-melt(balls)
lballs2<-melt(balls, id.vars=c("game", "site"))
lballs3<-melt(balls, id.vars=c("game", "site"), variable.name="name", value.name="points")


dcast(lballs, game+site~variable, sum)

dcast(lballs3, game+site~name, sum)

dcast(lballs3, name~game+site, sum)

dcast(lballs3, name~site, sum)

dcast(lballs3, name~site, mean)

dcast(lballs3, site~name, mean)

dcast(lballs3, site+name~game, sum)