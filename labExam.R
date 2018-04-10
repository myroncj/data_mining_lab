View(liver) #View the dataset
liver2 = liver #make a copy of the dataset
View(liver2) #view the copy
liver2$selector = NULL #remove the selector value because it divides the dataset in 2 partitions
View(liver2) #view dataset after removal of selector
kmeans(liver2,3) #cluster the dataset using the kmeans function
kresult1 = kmeans(liver2,3) #store the result of kmeans into a variable
plot(liver2[c("mcv","drinks")], col = kresult1$cluster ) #plot the result 
kresult1$centers #custer centers
kresult1$size #number of points in each cluster
points(kresult1$centers[,c("mcv", "drinks")], col = 1:3, pch = 8, cex=2)  #centers of the clusters are plotted

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
} #function to normalize the data
liver2norm = as.data.frame(lapply(liver2, normalize))
View(liver2norm)
kmeans(liver2norm,3)
kresult2 = kmeans(liver2norm,3)
plot(liver2norm[c("mcv","drinks")], col = kresult2$cluster )
kresult2$centers
kresult2$size
points(kresult2$centers[,c("mcv", "drinks")], col = 1:3, pch = 8, cex=2)
