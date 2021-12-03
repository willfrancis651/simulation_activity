rm(list=ls())

path<-dirname(rstudioapi::getActiveDocumentContext()$path)
input_dir<-path
setwd(path)
getwd()

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



