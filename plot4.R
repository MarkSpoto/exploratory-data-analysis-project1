## setwd("p:/gitprojects/exploratory-data-analysis-project1")
## setwd("d:/CourseraClass/ExploratoryDataAnalysis/week1/exploratory-data-analysis-project1")

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

## Define Multiplot layout
par(mfrow = c(2,2), ps = 10, mar=c(4,4,2,1), oma=c(0,0,2,0))

## Create the plot for Global active power in quandrant 1, 1
xrange <- strptime(graphdata$RecordedDateTime, "%Y-%m-%d %H:%M:%S")  
plot(xrange, 
     graphdata$Global_active_power, 
     type = "l", 
     xlab = "",
     ylab = "Global Active Power")

## Create the plot for Voltage in quandrant 1, 2
xrange <- strptime(graphdata$RecordedDateTime, "%Y-%m-%d %H:%M:%S")  
plot(xrange, 
     graphdata$Voltage, 
     type = "l", 
     xlab = "datetime",
     ylab = "Voltage")

## Create the plot Sub Metering 1 in quandrant 2, 1
plot(xrange, 
     graphdata$Sub_metering_1, 
     type = "l", 
     xlab = "",
     ylab = "Energy sub metering")

lines(xrange, 
      graphdata$Sub_metering_2, 
      col = "red")

points(xrange, 
       graphdata$Sub_metering_3, 
       type = "l", 
       col = "blue")

legend("topright", lty=1, lwd=2, bty="n", text(font=list(family="Courier New", face=1:4)),
       xjust=30, cex=0.85,
       col=c("black","red","blue"), 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Create the plot for Global reactive power in quandrant 2, 2
plot(xrange, 
     graphdata$Global_reactive_power, 
     type = "l", 
     xlab = "datetime",
     ylab = "Global_reactive_power")

## Save the multi plot to file as PNG
dev.copy(png, file="./plot4.png", height=480, width=480)
dev.off()
