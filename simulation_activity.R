rm(list=ls())

path<-dirname(rstudioapi::getActiveDocumentContext()$path)
input_dir<-path
setwd(path)
getwd()

library(tidyverse)
library(GGally)
library(skimr)
library(data.table)

set.seed(1)

