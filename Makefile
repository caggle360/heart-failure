
# rule for creating first demographic table for continuous variables
.PHONY: report
report: R/06_HeartFailure_report.Rmd Figures_Tables/Boxplot.png Figures_Tables/Demographics_Discrete.png Figures_Tables/Demographics_Cont.png Clean_Data/cleaned_data.csv
	Rscript -e "rmarkdown::render('R/06_HeartFailure_report.Rmd', quiet = TRUE, output_file = '../output/report.html')"

Figures_Tables/Boxplot.png: R/05_makeFig1.R Clean_Data/cleaned_data.csv
	chmod +x R/05_makeFig1.R && \
	Rscript R/05_makeFig1.R	

# rule for creating discrete variable demographic table
Figures_Tables/Demographics_Discrete.png: R/04_createDemoTable2.R Clean_Data/cleaned_data.csv
	chmod +x R/04_createDemoTable2.R && \
	Rscript R/04_createDemoTable2.R	

# rule for creating continuous variable demographic table
Figures_Tables/Demographics_Cont.png: R/03_createDemoTable1.R Clean_Data/cleaned_data.csv
	chmod +x R/03_createDemoTable1.R && \
	Rscript R/03_createDemoTable1.R

# rule for cleaning up data
Clean_Data/cleaned_data.csv: R/02_cleanData.R Raw_Data/heartfailure.csv
	chmod +x R/02_cleanData.R && \
	Rscript R/02_cleanData.R

# rule for importing data from online
Raw_Data/heartfailure.csv: R/01_importData.R
	chmod +x R/01_importData.R && \
	Rscript R/01_importData.R

install: R/00_install.R
	chmod +x R/00_install.R && \
	Rscript R/00_install.R

.PHONY: build
build:
	docker build -t cgale108/heartfailure .

.PHONY: help
help:
	@echo "report                                   : Generates final analysis html report"
	@echo "Figures_Tables/Boxplot.png         		: Generates .png file of a boxplot for age by heart failure status"
	@echo "Figures_Tables/Demographics_Discrete.png : Generates a .png file for the Table for Demographic Discrete data"
	@echo "Figures_Tables/Demographics_Cont.png     : Generates a .png file for the Table for Demographic Continuous data"
	@echo "Clean_Data/cleaned_data.csv              : Cleans the data and creates the cleaned data set in a csv file"
	@echo "Raw_Data/heartfailure.csv                : Downloads the heartfailure csv file from URL"
	@echo "install                                  : Checks already installed packages and install needed packages that are not already installed"
	@echo "build									: Builds a docker image"