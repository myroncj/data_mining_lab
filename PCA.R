seed1 = seed
View(seed1)
summary(seed1)
s = cov(seed1)
s
sd.seed1 = apply(seed1,2,sd)
sd.seed1
R = cor(seed1)
R
eigen(s)
pca_seed = princomp(seed1,cor=FALSE)
names(pca_seed)
loadings(pca_seed)
summary(pca_seed)
mean(eigen(s)$values)
plot(pca_seed,type="lines")
eigen(s)$vectors[,1:2]
seed1.m = as.matrix(seed1)
scores = seed1.m%*%(eigen(s)$vector[,1:2])
cor(scores[,1],seed1)
cor(scores[,2],seed1)
scores = seed1.m%*%(eigen(s)$vector[,1:2])
plot(scores[,1],scores[,2],main="PCA scores plot of seed data")
View(pca_seed)
