data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?")

data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$dateTimeCombined <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

png("plot2.png")
plot(data$dateTimeCombined, data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()