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