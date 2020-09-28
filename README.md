## My Project

I will be analyzing a heart failure dataset from kaggle (https://www.kaggle.com/andrewmvd/heart-failure-clinical-data) in R. 

In order to run the .Rmd file to analyze the data, you will need to install some R packages which can be installed by running the following commands. 

``` r installed_pkgs <- row.names(installed.packages())
pkgs <- c("gt", "dplyr", "data.table")
for(p in pkgs){
	if(!(p %in% installed_pkgs)){
		install.packages(p)
	}
}
```
## Execute the analysis

In order to run the analysis, navigate to your project folder on the command line and run

``` bash
Rscript -e "rmarkdown::render('HeartFailure_report.Rmd')"
```
Running this script will create an html file called HeartFailure_report.html