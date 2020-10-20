# 00_importData.R file downloads the data and puts it in the Raw_data folder

# Import data directly from PLOS ONE (link pulled from Kaggle)
URL <- "https://plos.figshare.com/ndownloader/files/8937223"

# Download and write data to the raw_data folder
download.file(URL, "Raw_data/heartfailure.csv")

