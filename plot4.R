#reading the data
data <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";", dec = ".")
#subsetting the data for the given dates
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
power <- as.numeric(data$Global_active_power)

#converting the date and time variables to Date/Time classes
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#
power_active <- as.numeric(data$Global_active_power)

m1 <- as.numeric(data$Sub_metering_1)
m2 <- as.numeric(data$Sub_metering_2)
m3 <- as.numeric(data$Sub_metering_3)

power_reactive <- as.numeric(data$Global_reactive_power)
v <- as.numeric(data$Voltage)

png("plot4.png", width = 480 , height = 480)
par(mfrow = c(2,2) , mar = c(4,2,1,2))


plot(datetime, power_active, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, v, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, m1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, m2, type="l", col="red")
lines(datetime, m3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, power_reactive, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()