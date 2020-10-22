#! /usr/local/bin/Rscript

# Load libraries
library(survival)
library(survminer)

source("functions/good_round.R")

# Load the data
data <- read.csv("Clean_Data/cleaned_data.csv", header = TRUE, sep = ",")

# Fit a Kaplan-Meier curve
KM <- survfit(Surv(follow_up_days, heart_failure) ~ high_BP, data = data)
png("Figures_Tables/SurvivalCurve.png")
ggsurvplot(KM, title = "Survival curves by blood pressure status", data = data)
dev.off()