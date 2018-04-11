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
plot(testPred,type="simple")


#Using J48 from RWeka package
library(RWeka)
library(party)

str(iris)
m1 <- J48(Species~., data = trainData)
if(require("party", quietly = TRUE)) plot(m1)
summary(m1)
predm1 = predict(m1,newdata = testData)
summary(predm1)


#Using C5.0
weather
str(weather)
set.seed(123)
weather$Windy<-as.factor(weather$Windy)
weather$Play.golf<-as.factor(weather$Play.golf)
traindata<-weather[1:10,]
#View(traindata)
str(traindata) 
testdata<-weather[11:14,]
#View(testdata)
str(testdata) 
prop.table(table(traindata$Play.golf))
prop.table(table(testdata$Play.golf))

#install.packages("C50")
library(C50)
train_model <- C5.0(traindata[,1:4], traindata$Play.golf)
train_model
train_model$tree
plot(train_model)
summary(train_model)
train_pred <- predict(train_model, testdata)
#install.packages("gmodels")
library(gmodels)
CrossTable(testdata$Play.golf,train_pred,prop.chisq = FALSE,prop.r = FALSE, dnn = c('Actual Play.golf', 'Predicted Play.golf'))

