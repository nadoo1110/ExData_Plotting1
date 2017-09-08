#reading the data
data <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";", dec = ".")
#subsetting the data for the given dates
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
power <- as.numeric(data$Global_active_power)

#converting the date and time variables to Date/Time classes
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#
power <- as.numeric(data$Global_active_power)

# opening the png graphic device with the given file name
png("plot2.png", width = 480, height = 480)

#plotting the power versus date 
plot(datetime, power, type = "l", xlab = "", ylab = "Global Active Power in kiloWatts")
dev.off()