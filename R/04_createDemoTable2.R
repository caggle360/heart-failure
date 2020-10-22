#! /usr/local/bin/Rscript 

# Import rounding function
source("functions/good_round.R")

# Import libraries
library(gt)
library(dplyr)
library(data.table)

# Load the data
data <- read.csv("Clean_Data/cleaned_data.csv", header = TRUE, sep = ",")

# Convert binary variables to factors so we can summarize each variable correctly
colsToFactor <- c("heart_failure", "sex", "smoker", "diabetic", "high_BP", "anemic")
data[colsToFactor] <- lapply(data[colsToFactor], factor)

# Summarize and print a table with summary statistics for each discrete variable
rowname = c("Male", "Smoker", "Diabetic", "High Blood Pressure", "Anemic")

dataNoHF <- data[data$heart_failure ==0,]
dataHF <- data[data$heart_failure ==1,]

# Get summary statistics for people with no heart failure
dataSummaryNoHF <- as.data.frame(rbind(summary(dataNoHF$sex), summary(dataNoHF$smoker), summary(dataNoHF$diabetic), summary(dataNoHF$high_BP), summary(dataNoHF$anemic)))

dataSummaryNoHF$`0` <- NULL

# Get percentage out of 203 (number of subjects with no heart failure)
dataSummaryNoHF$Percent <- dataSummaryNoHF$`1` / 203 * 100


# Round percentage to two decimal places
dataSummaryNoHF[2] <- sapply(dataSummaryNoHF[2], good_round)

colnames(dataSummaryNoHF) <- c("No Heart Failure 
                               (N=203)", "% of No HF")

########

# Get summary statistics for people with no heart failure
dataSummaryHF <- as.data.frame(rbind(summary(dataHF$sex), summary(dataHF$smoker), summary(dataHF$diabetic), summary(dataHF$high_BP), summary(dataHF$anemic)))

dataSummaryHF$`0` <- NULL

# Get percentage out of 96 (number of subjects with  heart failure)
dataSummaryHF$Percent <- dataSummaryHF$`1` / 96 * 100

# Round percentage to two decimal places
dataSummaryHF[2] <- sapply(dataSummaryHF[2], good_round)

colnames(dataSummaryHF) <- c("Heart Failure
                             (N=96)", "% of HF")

dataSummaryDis <- as.data.frame(cbind(rowname, dataSummaryNoHF, dataSummaryHF))

gt_discrete <- 
  gt(dataSummaryDis) %>%
  tab_header(title = "Demographics by Heart Failure Status")

gt::gtsave(gt_discrete,"Figures_Tables/Demographics_Discrete.png")
