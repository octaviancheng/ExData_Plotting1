# plot1.R
# This file reads in the household_power_consumption.txt dataset.
# Then it extracts the data only for "2007-02-01" and "2007-02-02"
# It plots the histogram of global active power.

powerConsumptionData <- read.csv("household_power_consumption.txt",
                                 header = TRUE, sep = ";")

# Extract the data only for "2007-02-01" and "2007-02-02"
powerConsumptionData <- powerConsumptionData[
    powerConsumptionData[, "Date"] == "1/2/2007" |
    powerConsumptionData[, "Date"] == "2/2/2007", ]

# Transform date and time to datetime object
powerConsumptionData <- cbind(powerConsumptionData, datetime = strptime(
    paste(as.character(powerConsumptionData[, "Date"]),
          as.character(powerConsumptionData[, "Time"])),
    format = "%d/%m/%Y %H:%M:%S"))

# Open png device
png("plot1.png")

# Plot the histrogram
hist(as.numeric(as.character(powerConsumptionData$Global_active_power)), 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", 
     col = "red")

# Close the device
dev.off()

    

