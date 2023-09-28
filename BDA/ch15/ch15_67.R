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