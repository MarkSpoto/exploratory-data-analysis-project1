## setwd("p:/gitprojects/exploratory-data-analysis-project1")

dataCompressedFile <- "./household_power_consumption.zip"
datafile <- "./household_power_consumption.txt"

## Load Library and download packages if not installed
packages <- c("datasets", "dplyr")
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))  
}

library(dplyr)
library(datasets)

## decompress the data file from a zip package - NOTE: this could take some time
if (!file.exists(datafile)) {
  unzip(dataCompressedFile, unzip = "internal", overwrite = TRUE, exdir = ".")
}

## Open and read the house hold power consumption file
data <- read.csv(datafile, sep = ";", header = TRUE, fill = TRUE, na.strings = "?")
head(data)
names(data)

## Clean data
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Filter data for 02/01/2007 to 02/02/2007
ds <- dplyr::filter(data, Date >= "2007-02-01" & Date <= "2007-02-02")

summary(ds$Global_active_power)

## Create the Histogram on the screen
hist(ds$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red",
     axes = F
)
axis(side=1, at=seq(0,6, by=2))
axis(side=2, at=seq(0,1200, by=200))

## Save the histogram to file as PNG
dev.copy(png, file="./plot1.png", height=480, width=480)
dev.off()

