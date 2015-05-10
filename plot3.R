# plot3.R
# This file reads in the household_power_consumption.txt dataset.
# Then it extracts the data only for "2007-02-01" and "2007-02-02"
# It plots the line graphs of the energy of the 3 sub-meters.

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
png("plot3.png")

# Plot the 3 line graphs of the engery of the sub-metering
plot(x = powerConsumptionData[, "datetime"], 
     y = as.numeric(as.character(powerConsumptionData[, "Sub_metering_1"])), 
     type = "n", ylab = "Engery sub metering", xlab = "")

lines(x = powerConsumptionData[, "datetime"], 
      y = as.numeric(as.character(powerConsumptionData[, "Sub_metering_1"])), 
      col = "black")

lines(x = powerConsumptionData[, "datetime"], 
      y = as.numeric(as.character(powerConsumptionData[, "Sub_metering_2"])), 
      col = "red")

lines(x = powerConsumptionData[, "datetime"], 
      y = as.numeric(as.character(powerConsumptionData[, "Sub_metering_3"])), 
      col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = c(1, 1, 1))

dev.off()