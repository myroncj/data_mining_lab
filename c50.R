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
