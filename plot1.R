#reading the data
data <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";", dec = ".")
#subsetting the data for the given dates
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
power <- as.numeric(data$Global_active_power)

# opening the png graphic device with the given file name
png("plot1.png", width = 480, height = 480)

#histogram of power
hist(power, col = "red", xlab = "Global Active power (kilo Watts)", main = "Global Active Power")
dev.off()
