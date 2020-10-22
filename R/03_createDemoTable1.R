#! /usr/local/bin/Rscript 

# Import rounding function
source("functions/good_round.R")

# Import libraries
library(gt)
library(dplyr)
library(data.table)

# Load the data
data <- read.csv("Clean_Data/cleaned_data.csv", header = TRUE, sep = ",")

# Using dplyr get the mean of continuous variables by heart failure status
MeanBygroup <- data %>%
  group_by(heart_failure) %>%
  summarize(n = n(), follow_up_days = mean(follow_up_days), age = mean(age), EF =mean(ejection_fraction), 
            serum_sodium = mean(serum_sodium), serum_creatinine = mean(serum_creatinine), 
            platelets = mean(platelets), creatinine_phosphokinase = mean(creatinine_phosphokinase)) 

# first change heart_failure to an integer instead of factor or all variables will become factors after transposing
MeanBygroup$heart_failure <- as.integer(MeanBygroup$heart_failure)
MeanBygroup_t <- transpose(MeanBygroup)

# get row and columns in order
colnames(MeanBygroup_t) <- c("No Heart Failure", "Heart Failure")
rownames(MeanBygroup_t) <- colnames(MeanBygroup)
MeanBygroup_t <- MeanBygroup_t[-1,]
  
# Get the overall Mean of all continuous variables
OverallMean <- data %>%
  summarize(n = n(), follow_up_days = mean(follow_up_days), age = mean(age),
            EF=mean(ejection_fraction), serum_sodium = mean(serum_sodium),
            serum_creatinine = mean(serum_creatinine),  platelets = mean(platelets),
            creatinine_phosphokinase = mean(creatinine_phosphokinase))

# Transpose data
OverallMean_t <- transpose(OverallMean)

# get row and columns in order
colnames(OverallMean_t) <- "Overall"
rownames(OverallMean_t) <- colnames(OverallMean)

# Merge these two dataframes by the rownames
SummaryCont <- merge(MeanBygroup_t, OverallMean_t, by = 0, sort = FALSE)
# Give the column Row.names more descriptive names for the table
SummaryCont$Row.names <- c("N", "Follow-up Days", "Age (years)", "Ejection Fraction (%)",
                           "Serum Sodium (mEq/L)", "Serum Creatinine (mg/dL)", "Platelets (kiloplatelets/mL)",
                           "Creatinine Phosphokinase (mcg/L)")
# Rename the column Row.names, rowname so that the gt function will recognize it
colnames(SummaryCont)[1] = "rowname"

# Round data 
nameCol <- SummaryCont[1] #Need to take first column out
N <- sapply(SummaryCont[1,2:3], round, digits = 0)
WithoutName <- as.data.frame(sapply(SummaryCont[2:8, 2:3], good_round)) #Round

SummaryCont <- cbind(nameCol, rbind(N, WithoutName))


# Turn it into a table
gt_table <- 
  gt(SummaryCont) %>%
  tab_header(title = "Mean by Heart Failure Status")

gt::gtsave(gt_table,"Figures_Tables/Demographics_Cont.png")
