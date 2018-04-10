# Using CTReee from party package
str(iris)
set.seed(1234)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]
library(party)
myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
iris_ctree <- ctree(myFormula, data=trainData)
table(predict(iris_ctree), trainData$Species)
print(iris_ctree)
plot(iris_ctree)
plot(iris_ctree, type="simple")
testPred <- predict(iris_ctree, newdata = testData)
table(testPred, testData$Species)

#Using J48 from RWeka package
library(RWeka)
library(party)

str(iris)
m1 <- J48(Species~., data = iris)
if(require("party", quietly = TRUE)) plot(m1)
summary(m1)