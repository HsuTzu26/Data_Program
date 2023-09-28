month.data<-c(31,28,31,30,31,30,31,31,30,31,30,31)
names(month.data)<-month.name
month.data
names(month.data[month.data==31])



sort(islands,decreasing = TRUE)[30]
sort(islands,decreasing = TRUE)[35]

head(sort(islands,decreasing = TRUE),15)
tail(sort(islands,decreasing = TRUE),15)


sort(islands,decreasing = TRUE)[seq(1,length(islands),by=2)]
sort(islands,decreasing = TRUE)[seq(2,length(islands),by=2)]

