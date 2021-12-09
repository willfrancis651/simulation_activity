rm(list=ls())
dev.off()

path<-dirname(rstudioapi::getActiveDocumentContext()$path)
input_dir<-path
setwd(path)
getwd()

install.packages("tidyverse")
install.packages("GGally")
install.packages("skimr")
install.packages("randNames")

library(tidyverse)
library(GGally)
library(skimr)
library(data.table)
library(randNames)

names <- (rand_names(250, seed=22))

table(names$gender)
table(names$location.country)
table(names$registered.age)

names$name <- paste(names$name.first, names$name.last)

names_trim <- names[c('name', 'gender', 'location.country')]

colnames(names_trim)[colnames(names_trim) == 'location.country'] <- 'country'

#Male
male_numeric<-ifelse(names_trim$gender=="male", 1,0)
table(male_numeric)
       
table(names_trim$gender)

weight_male<-sample(34.2462:102.7386,male_numeric, replace=TRUE) #IQR
#151 pounds or 68.4924for men
#https://www.bannerhealth.com/staying-well/health-and-wellness/fitness-nutrition/ideal-weight - Male 5ft 7 and 5ft 8, use that as mean
#https://www.livescience.com/36470-human-population-weight.html#:~:text=The%20average%20body%20mass%2C%20globally,178%20pounds%20(80.7%20kg).


height_male<-rnorm(134, 1.7145, 0.07 ) 
# standard deviation of height FIND MEAN
#1,7145 or 5ft 7.5 inches for men with about 7cm standard deviation
#https://ourworldindata.org/human-height 
#https://biology.stackexchange.com/questions/9730/what-is-the-standard-deviation-of-adult-human-heights-for-males-and-females#:~:text=It's%20probably%20around%207%20cm%20for%20men%20and%206%20cm%20for%20women.

bmi_male<-weight_male/(height_male)^2
hist(bmi_male)
table(bmi_male)

#FEMALE
female_numeric<-ifelse(names_trim$gender=="female", 1,0)
table(female_numeric)

table(names_trim$gender)
?sample
weight_female<-sample(26.2:78.59, 116, replace=TRUE) #IQR
#115.5 pounds or 52.389919 kg
#https://www.bannerhealth.com/staying-well/health-and-wellness/fitness-nutrition/ideal-weight

height_female<-rnorm(116, 1.6002, 0.06 ) 
#1,7145 or 5ft 3 inches for men with about 6cm standard deviation
#https://ourworldindata.org/human-height#:~:text=How%20tall%20are%20women%20across,5%20foot%20and%203%20inches.
#https://biology.stackexchange.com/questions/9730/what-is-the-standard-deviation-of-adult-human-heights-for-males-and-females#:~:text=It's%20probably%20around%207%20cm%20for%20men%20and%206%20cm%20for%20women.

bmi_female<-weight_female/(height_female)^2
hist(bmi_female)
table(bmi_female)


