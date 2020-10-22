#! /usr/local/bin/Rscript 

# Get package names that are already installed
installed_pkgs <- row.names(installed.packages())

# Packages that need to be installed for this to work
pkgs <- c("gt", "dplyr", "data.table", "survival", "survminer")
for(p in pkgs){
	if(!(p %in% installed_pkgs)){
		install.packages(p, , repos="http://cran.us.r-project.org")
	}
}

# Extra package that should be installed to be able to save images
webshot::install_phantomjs()