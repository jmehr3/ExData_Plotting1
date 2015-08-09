data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?")

data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$dateTimeCombined <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

png("plot3.png")
plot(data$dateTimeCombined, data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
points(data$dateTimeCombined, data$Sub_metering_2, type = "l", col = "Red")
points(data$dateTimeCombined, data$Sub_metering_3, type = "l", col = "Blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()