## My Project

I will be analyzing a heart failure dataset from kaggle (https://www.kaggle.com/andrewmvd/heart-failure-clinical-data) in R.

First, fork and clone this repository on your local device.

Next, navigate to the heart-failure folder and create a folder called output within the heart-failure folder using the following command in the terminal.

```bash
mkdir output
```

This repo now contains: 
1. A Makefile that includes all of the rules that are needed to execute analysis.
2. A Dockerfile that built the image you will be pulling from Docker Hub
2. 6 folders: Figures_Tables, R, Raw_Data, Clean_Data, output, and functions.
	* Figures_Tables, Raw_Data, Clean_Data, and output will be empty until you run the the analysis (steps found later in the README). At that point, the data will be downloaded to the Raw_Data folder, data will be cleaned and put into the Clean_Data folder, and figures and tables will be saved as .png files in the Figures_Tables folder.
	* The final html file will output to the output folder
	* The R folder contains R script used to install packages, clean the data, and make tables and figures. It also contains the .Rmd file that will put the report together and output it as a .html file to the output folder
	* The functions folder contains an R function that is sourced in other R scripts used to round results.

There are two options you can use to run the analysis. Using Docker is preferred, but there are also instructions at the end of the document on how to run the analysis using only make commands if you do not have Docker installed.

## Execute the analysis using Docker (preferred)

In order to run the following commands, be sure you are in your project folder on the command line.

You can run the following command to see descriptions of each rule in the Makefile. But you won't need to run any make commands to complete the analysis with Docker.

```bash
make help
```

In order to analyze the data, you need to pull an image from Docker. This can be done using the following command

```bash
docker pull cgale108/heartfailure
```

Next, you will need to run the container and mount your local folder to the project directory in the container in order to be able to view the output on your local device

The exact syntax below will work if your folder is in the root directory. Otherwise modify the path before the : to reflect the location of the heart-failure folder on your local computer.

```bash
docker run -v ~/heart-failure/:/project cgale108/heartfailure
```
You should see a file called "report.html" in the output folder on your local device that contains the output of the analysis.


## Execute the analysis using Make (If you do not have Docker installed)

In order to run the following commands, be sure you are in your project folder on the command line.

Run the following command to see descriptions of each rule in the Makefile

```bash
make help
```

You will need to install some R packages in order to execute the analysis. These packages can be installed by running the following command.

```bash
make install
```

Run the following command in order to create the final html report called "report.html". This report will be found in the output folder.

```bash
make report
```