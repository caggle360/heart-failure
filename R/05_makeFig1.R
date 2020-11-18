#! /usr/local/bin/Rscript

# Load libraries
library(ggplot2)

# Load the data
data <- read.csv("Clean_Data/cleaned_data.csv", header = TRUE, sep = ",")

png("Figures_Tables/Boxplot.png")
ggplot(data, aes(x = factor(heart_failure), y = age, color = factor(heart_failure))) + geom_boxplot() +
  theme(legend.position = "none") +
  ggtitle("Age by heart failure status") +
  xlab("Heart Failure status") +
  ylab("Frequency")
dev.off()