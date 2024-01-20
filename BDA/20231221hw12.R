#Check the dimensionality
dim(iris)
#Variable names or column names
names(iris)
#Structure
str(iris)
#Attributes
attributes(iris)
#Get the first 5 rows
iris[1:5]
#Get Sepal.Length of the first 10 rows
iris[1:10, "Sepal.Length"]
#Same as above
iris$Sepal.Length[1:10]
#Distribution of every variable
summary(iris)
#Frequency
table(iris$Species)
#Pie chart
pie(table(iris$Species))
#Variance of Sepal.Length
var(iris$Sepal.Length)
#Covariance of two variables
cov(iris$Sepal.Length, iris$Petal.Length)
#Histogram
hist(iris$Sepal.Length)
#Density
plot(density(iris$Sepal.Length))
#Pair plot
plot(iris)
#or
pairs(iris)


irisCluster <- iris

# H0: sample is taken from a normal distribution
# 若 p-value < 0.05 則拒絕假設→非常態分布
hist(irisCluster$Sepal.Length)
qqnorm(irisCluster$Sepal.Length)
qqline(irisCluster$Sepal.Length)
shapiro.test(irisCluster$Sepal.Length) #p-value=0.01018 <0.05

hist(irisCluster$Sepal.Width)
qqnorm(irisCluster$Sepal.Width)
qqline(irisCluster$Sepal.Width)
shapiro.test(irisCluster$Sepal.Width) #p-value = 0.1012 >0.05

hist(irisCluster$Petal.Length)
qqnorm(irisCluster$Petal.Length)
qqline(irisCluster$Petal.Length)
shapiro.test(irisCluster$Petal.Length) #p-value = 7.412e-10 <0.05

hist(irisCluster$Petal.Width)
qqnorm(irisCluster$Petal.Width)
qqline(irisCluster$Petal.Width)
shapiro.test(irisCluster$Petal.Width) # p-value = 1.68e-08


#Decision Trees
install.packages("party")
library("party")#should be installed by install.packages("party")
str(irisCluster)
#Call function ctree to build a decision tree.
#The first parameter is a formula, 
#which defines a target variable and a list of independent variables.
# iris_ctree <- ctree(Species ~ Sepal.Length + 
#               Sepal.Width + Petal.Length + Petal.Width, data=iris)
train_data <- irisCluster[1:100, ]
test_data <- irisCluster[101:150, ]
iris_ctree <- ctree(Species ~ Sepal.Length + Sepal.Width, data=irisCluster)
print(iris_ctree)
plot(iris_ctree)
plot(iris_ctree, type="simple")

predictions <- predict(iris_ctree, test_data)
accuracy <- sum(predictions == test_data$Species) / length(test_data$Species)
print(accuracy)

#k-means Clustering
newiris <- iris
newiris$Species <- NULL
#Apply kmeans to newiris, 
#and store the clustering result in kc. 
#The cluster number is set to 3.
(kc <- kmeans(newiris, 3))
#Compare the Species label with the clustering result
table(iris$Species, kc$cluster)
table(kc$cluster)
#Plot the clusters and their centres. 
#Note that there are four dimensions in the data 
#and that only the first two dimensions are used to draw the plot below. 
#Some black points close to the green centre (asterisk) are actually closer 
#to the black centre in the four dimensional space.
plot(newiris[c("Sepal.Length", "Sepal.Width")], col=kc$cluster)
points(kc$centers[,c("Sepal.Length", "Sepal.Width")], col=1:3, pch=8, cex=2)

table(iris$Species, kc$cluster)
# 計算準確率
accuracy <- sum(50,48,36) / sum(confusion_matrix)
print(accuracy)



