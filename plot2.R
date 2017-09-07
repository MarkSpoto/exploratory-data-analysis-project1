## setwd("p:/gitprojects/exploratory-data-analysis-project1")

dataCompressedFile <- "./household_power_consumption.zip"
datafile <- "./household_power_consumption.txt"

## Load Library and download packages if not installed
packages <- c("datasets", "dplyr", "lubridate")
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))  
}

library(dplyr)
library(datasets)
library(lubridate)

## decompress the data file from a zip package - NOTE: this could take some time
if (!file.exists(datafile)) {
  unzip(dataCompressedFile, unzip = "internal", overwrite = TRUE, exdir = ".")
}

## Open and read the house hold power consumption file
data <- read.csv(datafile, sep = ";", header = TRUE, fill = TRUE, na.strings = "?")
head(data)
names(data)

## Filter data for 02/01/2007 to 02/02/2007
data$Date <- as.Date(data$Date, "%d/%m/%Y")
graphdata <- filter(data, Date >= "2007-02-01" & Date <= "2007-02-02")

## After filtering data, add data points for day of week
graphdata <- mutate(graphdata, RecordedDateTime = paste(Date, Time))
graphdata <- mutate(graphdata, DayOfWeek = wday(Date)) %>% mutate(DayOfWeekName = wday(Date, label=TRUE))

## Create the plot diagram (dplyr does not allow POSIX date time therefore not mutated using strptime)
xrange <- strptime(graphdata$RecordedDateTime, "%Y-%m-%d %H:%M:%S")  
yrange <- graphdata$Global_active_power
plot(xrange, 
     yrange, 
     type = "l", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

## Save the line plot to file as PNG
dev.copy(png, file="./plot2.png", height=480, width=480)
dev.off()

