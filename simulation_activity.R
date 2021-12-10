rm(list=ls())

path<-dirname(rstudioapi::getActiveDocumentContext()$path)
input_dir<-path
setwd(path)
getwd()

library(tidyverse))
library(randNames)

# Generating 250 random sample profiles and extracting the name, gender, country, and city variables.

names <- (rand_names(250, seed=22))

names$name <- paste(names$name.first, names$name.last)

names_trim <- names[c('name', 'gender', 'location.country', 'location.city')]

colnames(names_trim)[colnames(names_trim) == 'location.country'] <- 'country'

colnames(names_trim)[colnames(names_trim) == 'location.city'] <- 'city'

# Generating 250 random education profiles.

education_levels <- list('Primary', 'High School', 'Bachelor', 'Master', 'PhD')
probs <- list(0.08, 0.6, 0.1, 0.1, 0.12)

education <- sample(education_levels, 250, prob = probs, replace = TRUE)

# Generating 250 random ages between 18-64.

age <- sample(c(18:64), 250, replace=TRUE)

# Generating a random case control status for each sample. 

case_control_status <- sample(c(0,1), 250, replace=TRUE)

# Generating 10 columns giving gene expression values between -1 and 1.

gene_expression_cols <- 1:10

sim_genes <- data.frame(c(1:250))

for (col in gene_expression_cols) {
  new_col <- runif(250, -1, 1)
  sim_genes[, ncol(sim_genes) + 1] <- new_col
  colnames(sim_genes)[ncol(sim_genes)] <- paste0("gene_expression_", col)
}

sim_genes$c.1.250. <- NULL

# Generating 5 columns giving SNP data with values 0, 1, or 2. Assumed a major allele with a frequency
# of 0.85, a common minor allele with a frequency of 0.12, and an infrequent variant with a frequency
# of 0.03.

SNP_cols <- 1:5

sim_snps <- data.frame(c(1:250))

for (col in SNP_cols) {
  new_col <- sample(c(0,1,2), 250, prob=(sample(c(0.03, 0.12, 0.85), 3, replace=FALSE)), replace=TRUE)
  sim_snps[, ncol(sim_snps) + 1] <- new_col
  colnames(sim_snps)[ncol(sim_snps)] <- paste0("SNP_", col)
}

sim_snps$c.1.250. <- NULL

# Full dataframe

full_df <- names_trim
full_df$age <- age
full_df$education <- education
full_df$case_control_status <- case_control_status
full_df <- cbind(full_df, sim_genes)
full_df <- cbind(full_df, sim_snps)
