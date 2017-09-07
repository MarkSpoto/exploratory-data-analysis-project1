setwd("d:/CourseraClass/ExploratoryDataAnalysis/Week1/ExData_Plotting1")

## Load Library and download packages if not installed
packages <- c("datasets", "dplyr")
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))  
}

## Open and read the house hold power consumption file
data <- read.csv("./household_power_consumption.txt", sep = ";", header = TRUE, fill = TRUE, na.strings = "?")
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
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

