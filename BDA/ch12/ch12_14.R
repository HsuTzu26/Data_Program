# 
# 實例ch12_14.R
#
ch12_14 <- function( type )
{
  switch (type, iphone = "Apple", 
          TV = "Sony", 
          PC = "Dell")
}