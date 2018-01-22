str(Titanic)
df<-as.data.frame(Titanic)
head(df)
View(df)
titanic.raw<-NULL
for(i in 1:4){
  titanic.raw<-cbind(titanic.raw,rep(as.character(df[,i]),df$Freq))
}
# cbind-> binds the various columns 
# rep-> replicates the  data in x and number of times it replicates as the other argument

titanic.raw <- as.data.frame(titanic.raw)
View(titanic.raw)
names(titanic.raw) <- names(df)[1:4]
dim(titanic.raw)
str(titanic.raw)
head(titanic.raw)
summary(titanic.raw)
install.packages("arules")
library("arules")

# find association rules with default settings
rules.all<-apriori(titanic.raw)
quality(rules.all) <- round(quality(rules.all), digits=3) 
rules.all
inspect(rules.all) 

## rules with rhs containing "Survived" only
rules <- apriori(titanic.raw, control = list(verbose=F),  parameter = list(minlen=2, supp=0.005, conf=0.8), appearance = list(rhs=c("Survived=No", "Survived=Yes"), default="lhs"))
quality(rules) <- round(quality(rules), digits=3)
rules.sorted <- sort(rules, by="lift")
inspect(rules.sorted)

# find redundant rules 
subset.matrix <- is.subset(rules.sorted, rules.sorted,sparse=FALSE)
subset.matrix[lower.tri(subset.matrix, diag=T)] <- NA
redundant <- colSums(subset.matrix, na.rm=T) >= 1 
which(redundant)

# remove redundant rules 
rules.pruned <- rules.sorted[!redundant]
inspect(rules.pruned)
rules <- apriori(titanic.raw,parameter = list(minlen=3, supp=0.002, conf=0.2),appearance = list(rhs=c("Survived=Yes"),lhs=c("Class=1st", "Class=2nd", "Class=3rd", "Age=Child", "Age=Adult"), default="none"),control = list(verbose=F))
rules.sorted <- sort(rules, by="confidence")
inspect(rules.sorted)

# Visualizing association rules
install.packages("arulesViz")
library("arulesViz")
plot(rules.all)
plot(rules.all,method = "grouped")
plot(rules.all,method="graph")
plot(rules.all,method="graph",control=list(type="items"))
plot(rules.all, method="paracoord", control=list(reorder=TRUE)) 
plot(rules.pruned, method="paracoord", control=list(reorder=TRUE)) 
plot(rules.pruned,method="grouped")
plot(rules.pruned,method="graph")  
