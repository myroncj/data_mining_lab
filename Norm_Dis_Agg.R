  ##  DATA NORMALIZATION
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
dfNorm <- as.data.frame(lapply(d2, normalize))
View(dfNorm)
dfNormZ <- as.data.frame( scale(d2))
View(dfNormZ)
  
  ##  DATA DISCRETTIZATION
dim(d2)
View(d2)
head(d2)
#variable
x <- d2$Usage
#graph layout
def.par <- par(no.readonly = TRUE)
layout(mat=rbind(1:2,3:4))
library("arules")

#equal width
table(discretize(x, categories=3))
hist(x, breaks=20, main="Equal Width", xlab="USAGE")
abline(v=discretize(x, categories=3, onlycuts=TRUE), col="red")
#equal frequency
table(discretize(x, "frequency", categories=3))
hist(x, breaks=20, main="Equal Frequency", xlab="USAGE")
abline(v=discretize(x, method="frequency", categories=3, onlycuts=TRUE), col="red")
par(def.par)

  ##  DATA GROUPING
library("dplyr")
d2 %>%
  select(Duration,SMS,Usage) %>%
  group_by(SMS) %>%
  summarise(duration=mean(Duration),sms=mean(SMS),usage=mean(Usage))

  ##  DATA GROUPING USING AGGREGATE FUNCTION
attach(d2)
View(d2)
aggdata<-aggregate(d2,by=list(SMS,Usage),FUN=mean,na.rm=TRUE)
print(aggdata)