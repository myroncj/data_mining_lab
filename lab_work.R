var(mtcars) #gives the varience of the coloumns in mtcars dataset
density(mtcars[,2]) #computes the kernel density using the cylinder count count
summary(mtcars) #gives the summary of the coloums which includes Minimum value, 1st Quartile, Median, Mean, 3rd Quartile and Maximum value
sd(mtcars[,1]) #gives the standard deviation of the Miles per Gallon coloum
quantile(mtcars[,1]) #divides the data into parts.
cor(mtcars[,3],mtcars[,4]) #gives the correlation between -1 and 1. Accordingly it will be negative or positive correlation.
cov(mtcars[,3],mtcars[,4]) #gives the covarience

ks.test(mtcars[,3],mtcars[,4])  #gives the Kolmogorov–Smirnov test. 
sample(mtcars,2) #gives a sample from the dataset with the second parameter used to specify the number of attributes
cor.test(mtcars[,1],mtcars[,2]) #test to find the association between the pair of attributes specified
t.test(mtcars[,1]) #performs a variety of t-test on the dataset. Here only one parameter us used
t.test(mtcars[,1],mtcars[,3]) #this is a two sample t-test which results in multiple t-tests
mad(mtcars[,1]) #used to compute the mean absolute deviation of the attribute specified
 
hist(mtcars[,1]) #displays the histogram of the mpg i.e the Miles per gallon
plot(density(mtcars[,3])) #curve showing displacement of the vehicles
pie(table(mtcars[,10])) #pie chart of the gears of the car
barplot(table(mtcars[,2])) #barplot of the no. of cylinders in the cars