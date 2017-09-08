#reading the data
data <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";", dec = ".")
#subsetting the data for the given dates
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
power <- as.numeric(data$Global_active_power)

#converting the date and time variables to Date/Time classes
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#
power <- as.numeric(data$Global_active_power)

m1 <- as.numeric(data$Sub_metering_1)
m2 <- as.numeric(data$Sub_metering_2)
m3 <- as.numeric(data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, m1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, m2, type="l", col="red")
lines(datetime, m3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=4, col=c("black", "red", "blue"))
dev.off()