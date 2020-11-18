## My Project

I will be analyzing a heart failure dataset from kaggle (https://www.kaggle.com/andrewmvd/heart-failure-clinical-data) in R.

This repo contains: 
1. A Makefile that includes all of the rules that are needed to execute analysis.
2. 5 folders: Figures_Tables, R, Raw_Data, Clean_Data, and functions.
	* Figures_Tables, Raw_Data, Clean_Data, and output will be empty until you run the docker image command found at the end of this README. At that point, the data will be downloaded to the Raw_Data folder, data will be cleaned and put into the Clean_Data folder, and figures and tables will be saved as .png files in the Figures_Tables folder.
	* The final html file will output to the output folder
	* The R folder contains R script used to install packages, clean the data, and make tables and figures. It also contains the .Rmd file that will put the report together and output it as a .html file to the output folder
	* The functions folder contains an R function that is sourced in other R scripts used to round results.

In order to run the following commands, navigate to your project folder on the command line.

Run the following command to see descriptions of each rule in the Makefile

```bash
make help
```

## Execute the analysis

In order to analyze the data, you need to pull an image from Docker. This can be done using the following command

```bash
docker pull cgale108/heartFailure
```

Run the container and mount your local folder to the project directory in the container in order to be able to view the output on your local device

The exact syntax below will work if your folder is in the root directory. Otherwise modify the path before the : to reflect the location of the heart-failure folder on your local computer.

```bash
docker run -v ~/heart-failure/:/project cgale108/heartFailure
```
You should see a file called "report.html" in the output folder on your local computer that contains the output of the analysis.


