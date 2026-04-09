data <- read.table("/cloud/project/household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?",
                   colClasses = c("character","character", rep("numeric",7)))

data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(data$datetime, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

plot(data$datetime, data$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

plot(data$datetime, data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1, bty="n", cex=0.8)

plot(data$datetime, data$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()