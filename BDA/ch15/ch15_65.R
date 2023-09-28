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