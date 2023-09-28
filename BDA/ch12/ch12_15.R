# 
# 實例ch12_15.R
#
ch12_15 <- function( type )
{
  switch (type, iphone = "Apple", 
          TV = "Sony", 
          PC = "Dell",
          "Input Error!")
}