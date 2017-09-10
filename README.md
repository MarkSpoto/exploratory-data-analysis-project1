# Coursera Exploratory Data Analysis Project 1

### Introduction
This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the “Individual household electric power consumption Data Set” which I have made available on the course web site:

* **Dataset**: Electric power consumption [20Mb]
* **Description**: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

1. **Date:** Date in format dd/mm/yyyy
2. **Time:** time in format hh:mm:ss
3. **Global_active_power:** household global minute-averaged active power (in kilowatt)
4. **Global_reactive_power:** household global minute-averaged reactive power (in kilowatt)
5. **Voltage:** minute-averaged voltage (in volt)
6. **Global_intensity:** household global minute-averaged current intensity (in ampere)
7. **Sub_metering_1:** energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
8. **Sub_metering_2:** energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
9. **Sub_metering_3:** energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

### Files
The following are a list of files used to complete the assignment.  Note, all four assignments will only use a two day period for the days 2/1/2007 to 2/2/2007 and only the base plotting is allowed to be used.

* **household_power_consumption.zip:** is the dataset for Electric Power Consumption in a compressed format (zip file).  All of the R scripts will decompress the file if the decompressed file **household_power_consumption.txt** file does not exist.
* **plot1.R:** is the R script for creating the first graph in the assignment.  This graph will create a historgram of the frequency for Global Active Power in kilowatts over a two day period.
* **plot1.png:** is the Portable Network Graphic (PNG) outcome file from running the script plot1.R
* **plot2.R:** is the R script for creating the second graph in the assignment.  This graph will create a plot graph of the Global Active Power in kilowatts over a two day period which includes both date and time.  The dataset was mutated to merge both date and time together.  It then mutated the day of week for both the day of week number and short nanme based on the date
* **plot2.png:** is the Portable Network Graphic (PNG) outcome file from running the script plot2.R
* **plot3.R:** is the R script for creating the third graph in the assignment.  This graph will create a plot graph showing all points for Sub-Metering-1, Sub-Metering-2 and Sub-Metering-3 along with a legend over a two day period which includes both date and time.  The dataset was mutated to merge both date and time together.  It then mutated the day of week for both the day of week number and short nanme based on the date.
* **plot3.png:** is the Portable Network Graphic (PNG) outcome file from running the script plot3.R
* **plot4.R:** is the R script for creating the fourth graph in the assignment.  This will be a multi-plot graph showing a couple of the graphs created from the other assignments along with two new graphs showing Voltage and Global Reactive Power over a two day period which includes both date and time.   The dataset was mutated to merge both date and time together.  It then mutated the day of week for both the day of week number and short nanme based on the date.
* **plot4.png:** is the Portable Network Graphic (PNG) outcome file from running the script plot4.R

### Notes on Execution
Download the project which will include both the R scripts and PNG outcome files.  Each script will overwrite the PNG outcome files.  Each script can be run independently of the other.  They will all use the same **household_power_consumption.txt** file stored in the compressed **household_power_consumption.zip** file.

