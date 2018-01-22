iris2 = iris
iris2$Species = NULL
(kmeans.result = kmeans(iris2, 3))
table(iris$Species, kmeans.result$cluster)
plot(iris2[c("Sepal.Length", "Sepal.Width")], col = kmeans.result$cluster)
points(kmeans.result$centers[,c("Sepal.Length", "Sepal.Width")], col = 1:3, pch = 8, cex=2)
kmeans.result$centers
kmeans.result$totss
kmeans.result$withinss
kmeans.result$tot.withinss
kmeans.result$betweenss
kmeans.result$size
kmeans.result$iter
kmeans.result$ifault