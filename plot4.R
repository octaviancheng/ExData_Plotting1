# plot4.R
# This file reads in the household_power_consumption.txt dataset.
# Then it extracts the data only for "2007-02-01" and "2007-02-02"
# It plots the 4 plots on a 2x2 grids:
# 1) line graph of the global active power
# 2) line graph of the voltage
# 3) line graphs of the energy of the 3 sub-meters.
# 4) line graph of the global reactive power

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
png("plot4.png")

# 2x2 grid
par(mfrow = c(2, 2))

# Plot 1
plot(x = powerConsumptionData[, "datetime"], 
     y = as.numeric(as.character(powerConsumptionData[, "Global_active_power"])), 
     type = "l", xlab = "", ylab = "Global Active Power")

# Plot 2
plot(x = powerConsumptionData[, "datetime"], 
     y = as.numeric(as.character(powerConsumptionData[, "Voltage"])), 
     type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 3
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

# Plot 4
plot(x = powerConsumptionData[, "datetime"], 
     y = as.numeric(as.character(powerConsumptionData[, "Global_reactive_power"])), 
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()