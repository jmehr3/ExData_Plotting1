data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?")

data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$dateTimeCombined <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

png("plot4.png")
par(mfrow = c(2, 2))
with(data, {
  plot(dateTimeCombined, Global_active_power, type = "l", 
            xlab = "", ylab = "Global Active Power")
  plot(dateTimeCombined, Voltage, type = "l", xlab = "datetime")
  plot(dateTimeCombined, Sub_metering_1, type = "l", 
       xlab = "", ylab = "Energy sub metering")
  points(dateTimeCombined, Sub_metering_2, type = "l", col = "Red")
  points(dateTimeCombined, Sub_metering_3, type = "l", col = "Blue")
  legend("topright", lwd = 1, col = c("black", "red", "blue"), bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(dateTimeCombined, Global_reactive_power, type = "l", xlab = "datetime")
})
dev.off()