rm(list=ls())
dev.off()

install.packages("MASS")
library(MASS)

?rmsn
?mvnorm
??mvnorm
set.seed(22)
g<-mvrnorm(n=134, 68.4924, 13.1542, 1e-6)
height_male<-rnorm(134, 1.7145, 0.07 ) 
bmi_male<-g/(height_male)^2
hist(bmi_male)
