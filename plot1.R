data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?")

data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

png("plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (Kilowatts)", xlim = c(0, 6), axes = FALSE)
axis(1, at = c(0, 2, 4, 6))
axis(2)
dev.off()
