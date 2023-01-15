install.packages("readr")
library(readr)
setwd("d:/rtemp")
test <- read.csv("WHO.csv", sep=",",header=TRUE,stringsAsFactors=FALSE) # Åª¨úÀÉ®×

head(test)
str(test)
attach(test)
