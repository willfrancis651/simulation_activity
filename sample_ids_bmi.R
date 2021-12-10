
#make sample ids
full_df$sample_id <-sample(c(1:250), replace=F)

#make bmi column
#reference: https://ourworldindata.org/obesity
#add bmi to df as sampled from normal distribution
library(truncnorm)

full_df$bmi <- ifelse(names_trim$gender == 'female', rtruncnorm(250,a= 15, b= 40, mean=27), rtruncnorm(250,a=15,b=40, mean=25.5))

#adjust bmi for people in middle age
#reference: https://www.statista.com/statistics/375886/adult-s-body-mass-index-by-gender-and-age-in-england/
full_df$bmi_adj <- ifelse(full_df$age>=40 & full_df$age <= 65, (full_df$bmi + 2), full_df$bmi)

