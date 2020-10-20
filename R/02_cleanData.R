# 01_cleanData.R renames variables and coverts binary variables to factors

data <- read.csv("Raw_Data/heartfailure.csv", header = TRUE, sep = ",")

# Rename columns so they are more descriptive
names(data) <- c("follow_up_days", "heart_failure", "sex", "smoker", "diabetic", "high_BP", 
	"anemic", "age", "ejection_fraction", "serum_sodium", "serum_creatinine", "platelets", 
	"creatinine_phosphokinase")

write.csv(data, "Clean_Data/cleaned_data.csv", row.names = FALSE)