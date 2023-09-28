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