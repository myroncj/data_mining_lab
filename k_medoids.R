library(fpc)
iris2 = iris
iris2$Species = NULL
pamk.result = pamk(iris2)
pamk.result
pamk.result$nc
table(pamk.result$pamobject$clustering,iris$class)
layout(matrix(c(1,2),1,2))
plot(pamk.result$pamobject) #without specifying number of clusters

pamk.result = pamk(iris2,3)
plot(pamk.result$pamobject) #with 3 clusters

pamk.result$pamobject$diss

plot(pamk.result$pamobject$medoids)