## My Project

I will be analyzing a heart failure dataset from kaggle (https://www.kaggle.com/andrewmvd/heart-failure-clinical-data) in R. 

This repo contains: 
1. A Makefile that includes all of the rules that are needed to execute analysis.
2. 5 folders: Figures_Tables, R, Raw_Data, Clean_Data, and functions.
	* Figures_Tables, Raw_Data, and Clean_Data will be empty until you execute the analysis command found at the end of this README. At that point, the data will be downloaded to the Raw_Data folder, data will be cleaned and put into the Clean_Data folder, and figures and tables will be saved as .png files in the Figures_Tables folder.
	* The R folder contains R script used to install packages, clean the data, and make tables and figures. It also contains the .Rmd file that will put the report together and output it as a .html file.
	* The functions folder contains an R function that is sourced in other R scripts used to round results.

In order to run the following commands, navigate to your project folder on the command line.

Run the following command to see descriptions of each rule in the Makefile

```bash
make help
```

## Execute the analysis

You will need to install some R packages in order to execute the analysis. These packages can be installed by running the following command

```bash
make install
```

Run the following command in order to create the final html report called "report.html". This report will be output to the main project folder. 

``` bash
make report
```
